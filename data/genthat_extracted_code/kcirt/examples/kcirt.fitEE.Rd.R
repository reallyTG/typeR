library(kcirt)


### Name: kcirt.fitEE
### Title: Least Squares k-Cube Thurstonian IRT Fitting
### Aliases: kcirt.fitEE
### Keywords: ~kwd1 ~kwd2

### ** Examples

constructMap.ls <- list(
c(1,1,2,2),
c(1,1,3,3),
c(2,2,3,3),
c(1,1,2,2),
c(1,1,3,3),
c(2,2,3,3)
)

qTypes <- rep("R", length(constructMap.ls))

mod <- kcirt.model(constructMap.ls=constructMap.ls, qTypes=qTypes, mxLambda=NULL)

N <- 300
set.seed(99999)
mod <- kcirt.sim(model=mod, N=N)

ikcirt.df1(mod, "self")

mxHatLambda <- mod$mxLambda - matrix( rnorm( sum(mod$ns)^2, 0, 0.3 ), sum(mod$ns), sum(mod$ns) )

mod2 <- kcirt.fitEE(model=mod, mxHatLambda=mxHatLambda, maxIter=40)




