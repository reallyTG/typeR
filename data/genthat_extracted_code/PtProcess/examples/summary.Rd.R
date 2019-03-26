library(PtProcess)


### Name: summary
### Title: Summary of a Point Process Model
### Aliases: summary summary.mpp summary.linksrm
### Keywords: methods

### ** Examples

TT <- c(0, 1000)
bvalue <- 1
params <- c(-2.5, 0.01, 0.8, bvalue*log(10))

x <- mpp(data=NULL,
         gif=srm_gif,
         marks=list(NULL, rexp_mark),
         params=params,
         gmap=expression(params[1:3]),
         mmap=expression(params[4]),
         TT=TT)
x <- simulate(x, seed=5)

print(summary(x))



