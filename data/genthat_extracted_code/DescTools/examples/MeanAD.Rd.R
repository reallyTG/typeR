library(DescTools)


### Name: MeanAD
### Title: Mean Absolute Deviation From a Center Point
### Aliases: MeanAD
### Keywords: univar

### ** Examples

x <- runif(100)
MeanAD(x)

speed <- c(58, 88, 40, 60, 72, 66, 80, 48, NA)
MeanAD(speed)
MeanAD(speed, na.rm=TRUE)


# using the median as centerpoint
x <- c(2,3,5,3,1,15,23)

MeanAD(x, FUN=mean)
MeanAD(x, FUN=median)

# define a fix center
MeanAD(x, 4)



