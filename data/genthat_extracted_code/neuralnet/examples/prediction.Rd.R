library(neuralnet)


### Name: prediction
### Title: Summarizes the output of the neural network, the data and the
###   fitted values of glm objects (if available)
### Aliases: prediction
### Keywords: neural

### ** Examples


Var1 <- rpois(100,0.5)
Var2 <- rbinom(100,2,0.6)
Var3 <- rbinom(100,1,0.5)
SUM <- as.integer(abs(Var1+Var2+Var3+(rnorm(100))))
sum.data <- data.frame(Var1,Var2,Var3, SUM)
print(net.sum <- neuralnet( SUM~Var1+Var2+Var3,  sum.data, hidden=1, 
                 act.fct="tanh"))
main <- glm(SUM~Var1+Var2+Var3, sum.data, family=poisson())
full <- glm(SUM~Var1*Var2*Var3, sum.data, family=poisson())
prediction(net.sum, list.glm=list(main=main, full=full))




