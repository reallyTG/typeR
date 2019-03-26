library(miceMNAR)


### Name: mice.impute.hecknorm
### Title: Imputation by Heckman's model for continuous outcome with
###   Missing Not At Random mechanism using one-step estimator
### Aliases: mice.impute.hecknorm

### ** Examples


require("GJRM")
require(mvtnorm)

# Generation of a simulated dataset with MNAR mechanism on a continuous outcome

X1 <- rnorm(500,0,1)
X2 <- rbinom(500,1,0.5)
X3 <- rnorm(500,1,0.5)
  
errors <- rmvnorm(500,mean=c(0,0),sigma=matrix(c(1,0.3,0.3,1),nrow=2,byrow=TRUE))

Y <- X1+X2+errors[,1]
Ry <- ifelse(0.66+1*X1-0.5*X2+X3+errors[,2]>0,1,0)

Y[Ry==0] <- NA
  
simul_data <- data.frame(Y,X1,X2,X3)

JointModelEq <- generate_JointModelEq(data=simul_data,varMNAR = "Y")

JointModelEq[,"Y_var_sel"] <- c(0,1,1,1)
JointModelEq[,"Y_var_out"] <- c(0,1,1,0)

arg <- MNARargument(data=simul_data,varMNAR="Y",JointModelEq=JointModelEq)

## Not run: 
##D imputation2 <- mice(data = arg$data_mod,
##D                  method = arg$method,
##D                  predictorMatrix = arg$predictorMatrix,
##D                  JointModelEq=arg$JointModelEq,
##D                  control=arg$control,
##D                  maxit=1,m=5)
##D 
##D analysis2 <- with(imputation,lm(Y~X1+X2+X3))
##D result2 <- pool(analysis2)
##D summary(result2)
## End(Not run)



