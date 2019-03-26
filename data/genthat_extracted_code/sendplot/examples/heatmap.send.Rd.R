library(sendplot)


### Name: heatmap.send
### Title: INTERACTIVE HEATMAP
### Aliases: heatmap.send
### Keywords: methods

### ** Examples


library(sendplot)
library(rtiff)

require(graphics)


x  = as.matrix(mtcars)
rc = rainbow(nrow(x), start=0, end=.3)
cc = rainbow(ncol(x), start=0, end=.3)

xy.labels=list(value=x)


x.labels=data.frame(label=colnames(x),
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


heatmap.send(x,scale="column", xy.labels = xy.labels,
                 x.labels=x.labels,
                 RowSideColors = rc, ColSideColors = cc, margin=c(5,10),
                 xlab = "specification variables", ylab= "Car Models",
                 main = "mtcars data",
                 fname.root="exHeat",dir=direct,
                 font.size=18,image.size="600x900")






