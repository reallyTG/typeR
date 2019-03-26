library(qle)


### Name: crossValTx
### Title: Prediction variances by cross-validation
### Aliases: crossValTx

### ** Examples

data(normal)

# design matrix and statistics
X <- as.matrix(qsd$qldata[,1:2])
Tstat <- qsd$qldata[grep("^mean[.]",names(qsd$qldata))]

# construct but do not re-estimate
# covariance parameters by REML for CV models
qsd$cv.fit <- FALSE
cvm <- prefitCV(qsd)
theta0 <- c("mu"=2,"sd"=1)

# get mean squared deviation using cross-validation at theta0 
crossValTx(qsd, cvm, theta0, type = "msd")

# and kriging variance  
varKM(qsd$covT,theta0,X,Tstat) 	 





