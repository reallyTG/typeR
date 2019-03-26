# Example 1, Softmax classification with hidden layer and no regularization term
library(softmaxreg)
data(iris)
x = iris[,1:4]
y = iris$Species
# Training with hidden layer set 5 units
softmax_model = softmaxReg(x, y, hidden = c(5), maxit = 100, type = "class", algorithm = "adagrad", rate = 0.05, batch = 20)
summary(softmax_model)
yFitMat = softmax_model$fitted.values
yFit = c()
for (i in 1:length(y)) {
	yFit = c(yFit, which(yFitMat[i,]==max(yFitMat[i,])))
}
table(y, yFit)
# Caculate AIC and BIC information criterion
aic = AIC(softmax_model)
bic = BIC(softmax_model)
cat("AIC",aic,'\n')
cat("BIC",bic,'\n')

# Make new Prediction
newdata = iris[1:100,1:4]
yPred = predict(softmax_model, newdata)

# Example 2, Softmax classification with formula and dataframe input
f = formula(Species~.) # formula with succinct expression
softmax_model_fm = softmaxReg(f, data = iris, hidden = c(5), maxit = 100, type = "class", algorithm = "adagrad", rate = 0.05, batch = 20)
summary(softmax_model_fm)

# Example 3, Softmax classfication with L2 regularization
softmax_model_L2 = softmaxReg(x, y, hidden = c(5), maxit = 100, type = "class", algorithm = "adagrad", L2 = TRUE, penalty = 1e-4, batch = 20)
summary(softmax_model_L2)

# Compare Two Model Loss
# Note L2 loss value include the ||W||^2 term, that's why it's larger than loss without regularization
loss1 = softmax_model$loss
loss2 = softmax_model_L2$loss
plot(c(1:length(loss1)), loss1, xlab = "Iteration", ylab = "Loss Function Value",type = "l", col = "black")
lines(c(1:length(loss2)), loss2, col = "red") 
legend("topright", c("Loss 1: No Regularization", "Loss 2: L2 Regularization"), col = c("black", "red"),pch = 1)
