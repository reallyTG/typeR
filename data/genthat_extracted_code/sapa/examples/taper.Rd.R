library(sapa)


### Name: taper
### Title: Oracle function for obtaining a particular taper/window
### Aliases: taper as.matrix.taper plot.taper print.taper
### Keywords: ts

### ** Examples

require(ifultools)
## change plot layout 
gap <- 0.11
old.plt <- splitplot(4,4,1,gap=gap)

## create a plot of all supported tapers and 
## windows 
nms <- c("rectangle", "triangle", "raised cosine",
    "hanning", "hamming", "blackman",
    "nuttall", "gaussian", "kaiser",
    "chebyshev", "born jordan", "sine",
    "parzen", "papoulis", "daniell", "dpss")

for (i in seq(along=nms)){
    if (i > 1) splitplot(4,4,i,gap=gap)
    plot(taper(type=nms[i]))
}

## restore plot layout to initial state 
par(old.plt)



