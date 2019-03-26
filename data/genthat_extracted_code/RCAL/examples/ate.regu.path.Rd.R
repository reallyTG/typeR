library(RCAL)


### Name: ate.regu.path
### Title: Model-assisted inference for average treatment effects along
###   regularization paths
### Aliases: ate.regu.path

### ** Examples

## No test: 
data(simu.data)
n <- dim(simu.data)[1]
p <- dim(simu.data)[2]-2

y <- simu.data[,1]
tr <- simu.data[,2]
x <- simu.data[,2+1:p]
x <- scale(x)

ate.path.rcal <- ate.regu.path(fold=5*c(0,1), nrho=(1+10)*c(1,1), rho.seq=NULL, y, tr, x, 
                               ploss="cal", yloss="gaus")
ate.path.rcal$est
## End(No test)




