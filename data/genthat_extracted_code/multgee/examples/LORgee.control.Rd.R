library(multgee)


### Name: LORgee.control
### Title: Control For The GEE Solver
### Aliases: LORgee.control

### ** Examples

data(arthritis)
fitmod <- ordLORgee(y~factor(trt)+factor(baseline)+factor(time), 
                    data = arthritis, id = id, repeated = time)
## A one-step GEE estimator
fitmod1 <- update(fitmod, control = LORgee.control(maxiter=1))
coef(fitmod)
coef(fitmod1)



