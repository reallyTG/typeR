library(PtProcess)


### Name: logLik
### Title: Log Likelihood of a Point Process Model
### Aliases: logLik logLik.mpp logLik.linksrm
### Keywords: methods

### ** Examples

#    SRM: magnitude iid exponential with bvalue=1

TT <- c(0, 1000)
bvalue <- 1
params <- c(-2.5, 0.01, 0.8, bvalue*log(10))

#   calculate log-likelihood excluding the mark density term
x1 <- mpp(data=NULL,
          gif=srm_gif,
          marks=list(NULL, rexp_mark),
          params=params,
          gmap=expression(params[1:3]),
          mmap=expression(params[4]),
          TT=TT)
x1 <- simulate(x1, seed=5)
print(logLik(x1))

#   calculate log-likelihood including the mark density term
x2 <- mpp(data=x1$data,
          gif=srm_gif,
          marks=list(dexp_mark, rexp_mark),
          params=params,
          gmap=expression(params[1:3]),
          mmap=expression(params[4]),
          TT=TT)
print(logLik(x2))

#  contribution from magnitude marks
print(sum(dexp(x1$data$magnitude, rate=bvalue*log(10), log=TRUE)))



