library(qtlcharts)


### Name: iplotCurves
### Title: Plot of a bunch of curves, linked to points in scatterplots
### Aliases: iplotCurves
### Keywords: hplot

### ** Examples

# random growth curves, based on some data
times <- 1:16
n <- 100
start <- rnorm(n, 5.2, 0.8)
slope1to5 <- rnorm(n, 2.6, 0.5)
slope5to16 <- rnorm(n, 0.24 + 0.09*slope1to5, 0.195)
y <- matrix(ncol=16, nrow=n)
y[,1] <- start
for(j in 2:5)
    y[,j] <- y[,j-1] + slope1to5
for(j in 6:16)
    y[,j] <- y[,j-1] + slope5to16
y <- y + rnorm(prod(dim(y)), 0, 0.35)

## No test: 
iplotCurves(y, times, y[,c(1,5)], y[,c(5,16)],
            chartOpts=list(curves_xlab="Time", curves_ylab="Size",
                           scat1_xlab="Size at T=1", scat1_ylab="Size at T=5",
                           scat2_xlab="Size at T=5", scat2_ylab="Size at T=16"))
## End(No test)




