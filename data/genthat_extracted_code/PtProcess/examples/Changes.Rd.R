library(PtProcess)


### Name: Change Log
### Title: Changes Made to the Package
### Aliases: Changes
### Keywords: documentation

### ** Examples

#    SRM: magnitude is iid exponential with bvalue=1
#    simulate and calculate the log-likelihood

TT <- c(0, 1000)
bvalue <- 1
params <- c(-1.5, 0.01, 0.8, bvalue*log(10))

#   --- Old Method ---
# x <- pp.sim(NULL, params[1:3], srm.cif, TT, seed=5, magn.sim=1)
# print(pp.LL(x, srm.cif, params[1:3], TT))
# [1] -601.3941

#   --- New Method, no mark density ---
x1 <- mpp(data=NULL,
          gif=srm_gif,
          marks=list(NULL, rexp_mark),
          params=params,
          gmap=expression(params[1:3]),
          mmap=expression(params[4]),
          TT=TT)
x1 <- simulate(x1, seed=5)
print(logLik(x1))

#  An advantage of the object orientated format is that it
#  simplifies further analysis, e.g. plot intensity function:
plot(x1)
#  plot the residual process:
plot(residuals(x1))

#---------------------------------------------------
#    SRM: magnitude is iid exponential with bvalue=1
#    simulate then estimate parameters from data

#   --- Old Method ---
# TT <- c(0, 1000)
# bvalue <- 1
# params <- c(-2.5, 0.01, 0.8)
#
# x <- pp.sim(NULL, params, srm.cif, TT, seed=5, magn.sim=1)
#
# posterior <- make.posterior(x, srm.cif, TT)
#
# neg.posterior <- function(params){
#     x <- -posterior(params)
#     if (is.infinite(x) | is.na(x)) return(1e15)
#     else return(x)
# }
#
# z <- nlm(neg.posterior, params, typsize=abs(params),
#          iterlim=1000, print.level=2)
#
# print(z$estimate)
# [1] -2.83900091  0.01242595  0.78880647

#   --- New Method, no mark density ---
#   maximise only SRM parameters (like old method)

TT <- c(0, 1000)
bvalue <- 1
params <- c(-2.5, 0.01, 0.8, bvalue*log(10))

x1 <- mpp(data=NULL,
          gif=srm_gif,
          marks=list(dexp_mark, rexp_mark),
          params=params,
          gmap=expression(params[1:3]),
          mmap=expression(params[4]),
          TT=TT)
#  note that dexp_mark above is not used below
#  and could alternatively be replaced by NULL

x1 <- simulate(x1, seed=5)

#  maximise only SRM parameters
onlysrm <- function(y, p){
    #  maps srm parameters into model object
    #  the exp rate for magnitudes is unchanged
    y$params[1:3] <- p
    return(y)
}

params <- c(-2.5, 0.01, 0.8)

z1 <- nlm(neglogLik, params, object=x1, pmap=onlysrm,
          print.level=2, iterlim=500, typsize=abs(params))
print(z1$estimate)



