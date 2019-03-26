library(qle)


### Name: estim
### Title: Kriging prediction and numerical approximation of derivatives
### Aliases: estim jacobian

### ** Examples

data(normal) 

X <- as.matrix(qsd$qldata[,1:2])
p <- c("mu"=2,"sd"=1)

# get simulated statistics at design X
Tstat <- qsd$qldata[grep("^mean[.]",names(qsd$qldata))]

# low level prediction, variances and weights
estim(qsd$covT,p,X,Tstat,krig.type="var")

# Jacobian 
jacobian(qsd$covT,p,X,Tstat)
 
   



