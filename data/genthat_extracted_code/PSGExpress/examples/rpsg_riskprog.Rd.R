library(PSGExpress)


### Name: rpsg_riskprog
### Title: Solves risk minimization problems with linear constraints on
###   variables
### Aliases: rpsg_riskprog

### ** Examples

#Problem of CVaR minimization:
#Find x = (x1,x2,x3,x4) minimizing
#risk(x) = CVaR(0.95,x)
#subject to
#x1+x2+x3+x4 = 1
#x1>=0, x2>=0, x3>=0, x4>=0

input.model <- list()
input.model$risk <- "cvar_risk"
input.model$w <- 0.95
input.model$H<-matrix(c(1,4,8,3, 7,5,4,6, 2,8,1,0,0,3,4,9),nrow=4, byrow=TRUE)
input.model$c <- c(0.2, 0.11, 0.6, 0.1)
input.model$Aeq <- matrix(c(1, 1, 1, 1),nrow=1)
input.model$beq <- 1
input.model$lb<-c(0, 0, 0, 0)

options<-list()
options$solver <- "van"
options$precision <- 7
options$stages <- 30

results <- rpsg_riskprog(input.model,options)

print(results)




