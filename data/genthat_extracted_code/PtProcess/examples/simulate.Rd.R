library(PtProcess)


### Name: simulate
### Title: Simulate a Point Process
### Aliases: simulate simulate.mpp simulate.linksrm
### Keywords: methods datagen

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

y <- hist(x$data$magnitude, xlab="Magnitude", main="")

#   overlay with an exponential density
magn <- seq(0, 3, length.out=100)
points(magn, nrow(x$data)*(y$breaks[2]-y$breaks[1])*
             dexp(magn, rate=1/mean(x$data$magnitude)),
       col="red", type="l")



