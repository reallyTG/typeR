library(hdrcde)


### Name: hdr.2d
### Title: Bivariate Highest Density Regions
### Aliases: hdr.2d hdr.boxplot.2d hdr.2d plot.hdr2d plot.hdr2d
### Keywords: distribution hplot smooth

### ** Examples


x <- c(rnorm(200,0,1),rnorm(200,4,1))
y <- c(rnorm(200,0,1),rnorm(200,4,1))
hdr.boxplot.2d(x,y)

hdrinfo <- hdr.2d(x,y)
plot(hdrinfo, pointcol="red", show.points=TRUE, pch=3)




