library(hexbin)


### Name: hdiffplot
### Title: Plot of Domain and Median Differences of Two "hexbin" Objects
### Aliases: hdiffplot
### Keywords: hplot

### ** Examples

## Comparison of two bivariate boxplots
x1 <- rnorm(10000)
y1 <- rnorm(10000)
x2 <- rnorm(10000,mean=.5)
y2 <- rnorm(10000,mean=.5)
xbnds <- range(x1,x2)
ybnds <- range(y1,y2)

bin1 <- hexbin(x1,y1,xbnds=xbnds,ybnds=ybnds)
bin2 <- hexbin(x2,y2,xbnds=xbnds,ybnds=ybnds)
erodebin1 <- erode.hexbin(smooth.hexbin(bin1))
erodebin2 <- erode.hexbin(smooth.hexbin(bin2))

hdiffplot(erodebin1,erodebin2)

## Compare  *three* of them: --------------------

x3 <- rnorm(10000,mean=-1)
y3 <- rnorm(10000,mean=-.5)
xbnds <- range(x1,x2,x3)
ybnds <- range(y1,y2,y3)

bin1 <- hexbin(x1,y1,xbnds=xbnds,ybnds=ybnds)
bin2 <- hexbin(x2,y2,xbnds=xbnds,ybnds=ybnds)
bin3 <- hexbin(x3,y3,xbnds=xbnds,ybnds=ybnds)
erodebin1 <- erode.hexbin(smooth.hexbin(bin1))
erodebin2 <- erode.hexbin(smooth.hexbin(bin2))
erodebin3 <- erode.hexbin(smooth.hexbin(bin3))

bnlst <- list(b1=erodebin1, b2=erodebin2, b3=erodebin3)
hdiffplot(bnlst)



