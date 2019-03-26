library(TeachingDemos)


### Name: squishplot
### Title: Squish the plotting area to a specified aspect ratio
### Aliases: squishplot
### Keywords: dplot

### ** Examples

x <- rnorm(25, 10, 2 )
y <- 5 + 1.5*x + rnorm(25,0,2)

par(mfrow=c(1,3))
plot(x,y)

op <- squishplot(x,y,1)
plot(x,y)
par(op)

plot(x,y, asp=1)



