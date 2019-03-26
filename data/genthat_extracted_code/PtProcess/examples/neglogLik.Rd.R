library(PtProcess)


### Name: neglogLik
### Title: Negative Log-Likelihood
### Aliases: neglogLik
### Keywords: optimize

### ** Examples

#    SRM: magnitude is iid exponential with bvalue=1
#    maximise exponential mark density too

TT <- c(0, 1000)
bvalue <- 1
params <- c(-2.5, 0.01, 0.8, bvalue*log(10))

x <- mpp(data=NULL,
         gif=srm_gif,
         marks=list(dexp_mark, rexp_mark),
         params=params,
         gmap=expression(params[1:3]),
         mmap=expression(params[4]),
         TT=TT)
x <- simulate(x, seed=5)

allmap <- function(y, p){
    #    map all parameters into model object
    #    transform exponential param so it is positive
    y$params[1:3] <- p[1:3]
    y$params[4] <- exp(p[4])
    return(y)
}

params <- c(-2.5, 0.01, 0.8, log(bvalue*log(10)))

z <- nlm(neglogLik, params, object=x, pmap=allmap,
         print.level=2, iterlim=500, typsize=abs(params))
print(z$estimate)

#   these should be the same:
print(exp(z$estimate[4]))
print(1/mean(x$data$magnitude))



