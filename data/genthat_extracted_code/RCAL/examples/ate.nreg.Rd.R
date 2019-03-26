library(RCAL)


### Name: ate.nreg
### Title: Model-assisted inference for average treatment effects without
###   regularization
### Aliases: ate.nreg

### ** Examples

data(simu.data)
n <- dim(simu.data)[1]
p <- dim(simu.data)[2]-2

y <- simu.data[,1]
tr <- simu.data[,2]
x <- simu.data[,2+1:p]
x <- scale(x)

# include only 10 covariates
x2 <- x[,1:10]

ate.cal <- ate.nreg(y, tr, x2, ploss="cal", yloss="gaus")
matrix(unlist(ate.cal$est), ncol=2, byrow=TRUE,
dimnames=list(c("one", "ipw", "or", "est", "var", "ze", 
"diff.est", "diff.var", "diff.ze"), c("untreated", "treated")))




