library(RCAL)


### Name: ate.regu.cv
### Title: Model-assisted inference for average treatment effects based on
###   cross validation
### Aliases: ate.regu.cv

### ** Examples

## No test: 
data(simu.data)
n <- dim(simu.data)[1]
p <- dim(simu.data)[2]-2

y <- simu.data[,1]
tr <- simu.data[,2]
x <- simu.data[,2+1:p]
x <- scale(x)

ate.cv.rcal <- ate.regu.cv(fold=5*c(1,1), nrho=(1+10)*c(1,1), rho.seq=NULL, y, tr, x, 
                           ploss="cal", yloss="gaus")

matrix(unlist(ate.cv.rcal$est), ncol=2, byrow=TRUE, 
dimnames=list(c("one", "ipw", "or", "est", "var", "ze", 
"diff.est", "diff.var", "diff.ze"), c("untreated", "treated")))
## End(No test)




