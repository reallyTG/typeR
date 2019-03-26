library(generalCorr)


### Name: kern_ctrl
### Title: Kernel regression with control variables and optional residuals
###   and gradients.
### Aliases: kern_ctrl
### Keywords: amorphous apd derivative, kernel partial regression residuals

### ** Examples


## Not run: 
##D set.seed(34);x=matrix(sample(1:600)[1:50],ncol=5)
##D require(np)
##D k1=kern_ctrl(x[,1],x[,2],ctrl=x[,4:5])
##D print(k1$R2) #prints the R square of the kernel regression
## End(Not run)




