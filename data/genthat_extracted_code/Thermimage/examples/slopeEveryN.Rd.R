library(Thermimage)


### Name: slopeEveryN
### Title: Calculate the slope every nth data point.
### Aliases: slopeEveryN

### ** Examples

## Define a vector of 50 random numbers from 1 to 100
s<-ceiling(runif(50, 0, 100))
x<-seq(1,50,1)
# Calculate the slope value every 4th point
s10<-slopeEveryN(s,4)

plot(x,s,type="l",col="red")
lines(s10,col="black")




