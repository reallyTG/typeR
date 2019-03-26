library(RCAL)


### Name: mn.regu.path
### Title: Model-assisted inference for population means along a
###   regularization path
### Aliases: mn.regu.path

### ** Examples

## No test: 
data(simu.data)
n <- dim(simu.data)[1]
p <- dim(simu.data)[2]-2

y <- simu.data[,1]
tr <- simu.data[,2]
x <- simu.data[,2+1:p]
x <- scale(x)

# missing data
y[tr==0] <- NA

mn.path.rcal <- mn.regu.path(fold=5*c(0,1), nrho=(1+10)*c(1,1), y=y, tr=tr, x=x, 
                             ploss="cal", yloss="gaus")
mn.path.rcal$est
## End(No test)




