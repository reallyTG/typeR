library(PSGExpress)


### Name: rpsg_riskconstrprog
### Title: Solves risk minimization problems with constraint on a risk
###   function and linear constraints
### Aliases: rpsg_riskconstrprog

### ** Examples

#Problem of CVaR minimization with constraint on the mean profit:
#Find x = (x1,x2,x3,x4) minimizing
#risk(x) = CVaR(0.95,x)
#subject to
#Average Gain(x)>4.5
#x1+x2+x3+x4 = 1
#x1>=0, x2>=0, x3>=0, x4>=0

input.model <- list()
input.model$risk1 <- "cvar_risk"
input.model$w1 <- 0.95
input.model$H1<-matrix(c(1,4,8,3, 7,5,4,6, 2,8,1,0,0,3,4,9),nrow=4, byrow=TRUE)
input.model$c1 <- c(0.2, 0.11, 0.6, 0.1)
input.model$risk2 <- "avg"
input.model$H2<-matrix(c(1,4,8,3, 7,5,4,6, 2,8,1,0,0,3,4,9),nrow=4, byrow=TRUE)
input.model$c2 <- c(0.2, 0.11, 0.6, 0.1)
input.model$rineq <- -4.5
input.model$Aeq <- matrix(c(1, 1, 1, 1),nrow=1)
input.model$beq <- 1
input.model$lb<-c(0, 0, 0, 0)

options<-list()
options$solver <- "van"
options$precision <- 7
options$stages <- 30

results <- rpsg_riskconstrprog(input.model,options)

print(results)




