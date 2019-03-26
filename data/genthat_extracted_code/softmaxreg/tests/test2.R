# Example: Comparing different learning algorithms for softmax regressions
library(softmaxreg)
data(iris)
x = iris[,1:4]
y = iris$Species
model1 = softmaxReg(x, y, hidden = c(), funName = 'sigmoid', maxit = 100, rang = 0.1, type = "class", algorithm = "sgd", rate = 0.1, batch = 150)
loss1 = model1$loss

model2 = softmaxReg(x, y, hidden = c(), funName = 'sigmoid', maxit = 100, rang = 0.1, type = "class", algorithm = "adagrad", rate = 0.1, batch = 150)
loss2 = model2$loss

model3 = softmaxReg(x, y, hidden = c(), funName = 'sigmoid', maxit = 100, rang = 0.1, type = "class", algorithm = "rmsprop", rate = 0.1, batch = 150)
loss3 = model3$loss

model4 = softmaxReg(x, y, hidden = c(), funName = 'sigmoid', maxit = 100, rang = 0.1, type = "class", algorithm = "momentum", rate = 0.1, batch = 150)
loss4 = model4$loss

model5 = softmaxReg(x, y, hidden = c(), funName = 'sigmoid', maxit = 100, rang = 0.1, type = "class", algorithm = "nag", rate = 0.1, batch = 150)
loss5 = model5$loss

# plot the loss convergence
iteration = c(1:length(loss1))
plot(iteration, loss1, xlab = "iteration", ylab = "loss", ylim = c(0, max(loss1,loss2,loss3,loss4,loss5) + 0.01), 
    type = "p", col = "black", cex = 0.7)
title("Convergence Comparision Between Learning Algorithms")
points(iteration, loss2, col = "red", pch = 2, cex = 0.7)
points(iteration, loss3, col = "blue", pch = 3, cex = 0.7)
points(iteration, loss4, col = "green", pch = 4, cex = 0.7)
points(iteration, loss5, col = "magenta", pch = 5, cex = 0.7)

legend("topright", c("SGD", "Adagrad", "RMSprop", "Momentum", "NAG"), 
    col = c("black", "red", "blue", "green", "magenta"),pch = c(1,2,3,4,5))

## Comments: From this experiments we can see that momemtum learning algorithm
## generally converge faster than the standard sgd and its variations
