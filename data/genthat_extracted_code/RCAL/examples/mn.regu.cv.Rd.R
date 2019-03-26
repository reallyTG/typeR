library(RCAL)


### Name: mn.regu.cv
### Title: Model-assisted inference for population means based on cross
###   validation
### Aliases: mn.regu.cv

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

mn.cv.rcal <- mn.regu.cv(fold=5*c(1,1), nrho=(1+10)*c(1,1), rho.seq=NULL, y, tr, x, 
                         ploss="cal", yloss="gaus")
unlist(mn.cv.rcal$est)
## End(No test)




