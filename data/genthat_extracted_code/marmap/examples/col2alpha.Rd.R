library(marmap)


### Name: col2alpha
### Title: Adds alpha transparency to a (vector of) color(s)
### Aliases: col2alpha

### ** Examples

# Generate random data
dat <- rnorm(4000)

# plot with plain color for points
plot(dat,pch=19,col="red")

# Add some transparency to get a better idea of density
plot(dat,pch=19,col=col2alpha("red",.3))

# Same color for all points but with increasing alpha (decreasing transparency)
plot(dat,pch=19,col=col2alpha(rep("red",4000),seq(0,1,len=4000)))

# Two colors, same alpha
plot(dat,pch=19,col=col2alpha(rep(c("red","purple"),each=2000),.2))

# Four colors, gradient of transparency for each color
plot(dat,pch=19,col=col2alpha(rep(c("blue","purple","red","orange"),each=1000),seq(.1,.6,len=1000)))

# Alpha transparency applied to a gradient of colors
plot(dat,pch=19,col=col2alpha(rainbow(4000),.5))




