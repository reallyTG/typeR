library(PtProcess)


### Name: plot
### Title: Plot Point Process Ground Intensity Function
### Aliases: plot plot.mpp plot.linksrm
### Keywords: methods

### ** Examples

data(Ogata)

p <- c(0.02, 70.77, 0.47, 0.002, 1.25)
TT <- c(0, 800)
bvalue <- 1

#   Note that the plot function does not utilise the
#   information about mark distributions, hence these
#   arguments can be NULL

x <- mpp(data=Ogata,
         gif=etas_gif,
         marks=list(NULL, NULL),
         params=p,
         gmap=expression(params[1:5]),
         mmap=NULL,
         TT=TT)

plot(x, log=TRUE)



