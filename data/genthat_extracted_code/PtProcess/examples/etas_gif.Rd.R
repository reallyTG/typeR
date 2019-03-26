library(PtProcess)


### Name: etas_gif
### Title: Ground Intensity for ETAS Model
### Aliases: etas_gif
### Keywords: models

### ** Examples

#  Tangshan: ground intensity and magnitude time plots

data(Tangshan)
p <- c(0.007, 2.3, 0.98, 0.008, 0.94)
bvalue <- 1
TT <- c(0, 4018)

x <- mpp(data=Tangshan,
         gif=etas_gif,
         marks=list(dexp_mark, NULL),
         params=p,
         gmap=expression(params),
         mmap=expression(bvalue*log(10)),
         TT=TT)

par.default <- par(mfrow=c(1,1), mar=c(5.1, 4.1, 4.1, 2.1))
par(mfrow=c(2,1), mar=c(4.1, 4.1, 0.5, 1))

plot(x, log=TRUE, xlab="")

plot(Tangshan$time, Tangshan$magnitude+4, type="h",
     xlim=c(0, 4018),
     xlab="Days Since 1 January 1974", ylab="Magnitude")

par(par.default)



