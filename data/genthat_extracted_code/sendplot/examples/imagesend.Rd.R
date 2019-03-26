library(sendplot)


### Name: imagesend
### Title: INTERACTIVE IMAGE
### Aliases: imagesend
### Keywords: methods

### ** Examples

library(sendplot)
library(rtiff)
library(stats)

mai.mat = matrix(c(1,1,1,1), ncol=4)

carsX  = as.matrix(mtcars)
carsX <- sweep(carsX, 2, colMeans(carsX, na.rm = TRUE))
        sx <- apply(X=carsX, MARGIN=2, FUN="sd", na.rm = TRUE)
        carsX <- sweep(carsX, 2, sx, "/")

plot.call="image(x=1:dim(carsX)[2],y=1:dim(carsX)[1], z=t(carsX),axes =
FALSE, xlab = '', ylab = '');axis(1,1:dim(carsX)[2],
labels=colnames(carsX),las = 2, line = -0.5, tick = 0,cex.axis =.8);
axis(4,1:dim(carsX)[1], labels=rownames(carsX),las = 2, line = -0.5,
tick = 0,cex.axis =.65)"

xy.labels=list(value=round(carsX,3))

x.labels=data.frame(label=colnames(carsX),
  description=c("Miles/(US) gallon","Number of cylinders",
    "Displacement (cu.in.)",
    "Gross horsepower",
    "Rear axle ratio",
    "Weight (lb/1000)",
    "1/4 mile time",
    "V/S",
    "Transmission (0 = automatic, 1 = manual)",
    "Number of forward gears",
    "Number of carburetors")
  )


#set up temporary directory
direct = paste(tempdir(),"/",sep="")
direct

imagesend(plot.call=plot.call, 
           x.pos= 1:dim(carsX)[2],
           y.pos= 1:dim(carsX)[1],
           xy.type = "image.midpoints",
           xy.labels=xy.labels,
           spot.radius = 5,
           fname.root="manImage", dir=direct,
           window.size = "800x1100", 
           x.labels=x.labels, mai.mat=mai.mat)  





