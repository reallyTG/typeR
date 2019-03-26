library(StepReg)


### Name: stepwise
### Title: Stepwise Regression
### Aliases: stepwise
### Keywords: stepwise regression

### ** Examples

set.seed(4)
dfY <- data.frame(matrix(c(rnorm(20,0,2),c(rep(1,10),rep(2,10)),rnorm(20,2,3)),20,3))
colnames(dfY) <- paste("Y",1:3,sep="")
dfX <- data.frame(matrix(c(rnorm(100,0,2),rnorm(100,2,1)),20,10))
colnames(dfX) <- paste("X",1:10,sep="")
dfyx <- cbind(dfY,dfX)

#for univariate regression
y <- c("Y1")
notX <- c("Y3")
#for multivariate regression you can use this
ym <- c("Y1","Y3")
notXm <- NULL
#*  with continuous variable nested in class effect
ClassY2 <- c("Y2")
#*  without continuous variable nested in class effect
Class0 <- NULL
# without forced effect in regression model
include0 <- NULL
# force the 'Y2' into the regression model
includeY2 <- c("Y2")
selection <- 'stepwise'
tolerance <- 1e-7
Trace <- "Pillai"
sle <- 0.15
sls <- 0.15

#univariate regression for 'SBC' select and 'AIC' choose 
#without forced effect and continuous variable nested in class effect
stepwise(dfyx, y, notX, include0, Class0, selection, "SBC", sle, sls, tolerance, Trace, 'AIC')

#univariate regression for 'AICc' select and 'HQc' choose
#with forced effect and continuous variable nested in class effect 
stepwise(dfyx, y, notX, includeY2, ClassY2, selection, 'AICc', sle, sls, tolerance, Trace, 'HQc')

#multivariate regression for 'HQ' select and 'BIC' choose
#with forced effect and continuous variable nested in class effect
stepwise(dfyx, ym, notXm, includeY2, ClassY2, selection, 'HQ', sle, sls, tolerance, Trace, 'BIC')



