library(painter)


### Name: ColorBy
### Title: Assign colors using one or two numeric vectors
### Aliases: ColorBy ColorBy2
### Keywords: color

### ** Examples

x = runif(100)
y = runif(100)

colors = ColorBy(x,rainbow(100))
plot(x,y,col=colors,pch=16,cex=2)

colors = ColorBy2(x,y,SetSaturation("Red",seq(0,1,0.1)),SetSaturation("Blue",seq(0,1,0.1)))
plot(x,y,col=colors,pch=16,cex=2)



