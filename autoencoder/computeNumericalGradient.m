function numgrad = computeNumericalGradient(J, theta)
% numgrad = computeNumericalGradient(J, theta)
% theta: a vector of parameters
% J: a function that outputs a real-number. Calling y = J(theta) will return the
% function value at theta. 
  
% Initialize numgrad with zeros
numgrad = zeros(size(theta));

%% ---------- YOUR CODE HERE --------------------------------------
% Instructions: 
% Implement numerical gradient checking, and return the result in numgrad.  
% (See Section 2.3 of the lecture notes.)
% You should write code so that numgrad(i) is (the numerical approximation to) the 
% partial derivative of J with respect to the i-th input argument, evaluated at theta.  
% I.e., numgrad(i) should be the (approximately) the partial derivative of J with 
% respect to theta(i).
%                
% Hint: You will probably want to compute the elements of numgrad one at a time. 

EPSILON = 0.0001;
for i = 1:length(theta)
    if mod(i, 100) == 0
        disp(['i = ' num2str(i) ' / ' num2str(length(theta))]);
    end
    thetaP = theta;
    thetaP(i) = thetaP(i) + EPSILON;
    
    thetaN = theta;
    thetaN(i) = thetaN(i) - EPSILON;
    
    numgrad(i) = (J(thetaP) - J(thetaN)) / (2 * EPSILON);
end




%% ---------------------------------------------------------------
end
