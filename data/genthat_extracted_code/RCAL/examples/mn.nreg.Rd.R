library(RCAL)


### Name: mn.nreg
### Title: Model-assisted inference for population means without
###   regularization
### Aliases: mn.nreg

### ** Examples

data(simu.data)
n <- dim(simu.data)[1]
p <- dim(simu.data)[2]-2

y <- simu.data[,1]
tr <- simu.data[,2]
x <- simu.data[,2+1:p]
x <- scale(x)

# missing data
y[tr==0] <- NA

# include only 10 covariates
x2 <- x[,1:10]

mn.cal <- mn.nreg(y, tr, x2, ploss="cal", yloss="gaus")
unlist(mn.cal$est)




