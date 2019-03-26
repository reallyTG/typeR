library(icesAdvice)


### Name: DLS3.2
### Title: DLS Method 3.2
### Aliases: DLS3.2

### ** Examples

# Three hypothetical surveys
survey <- data.frame(year=2001:2010, randu[1:10,])

DLS3.2(1000, survey$x)

DLS3.2(1000, survey$y)
DLS3.2(1000, survey$y, len=c(5,2))

DLS3.2(1000, survey$z)
DLS3.2(1000, survey$z, buffer=TRUE)

# Plot
output <- DLS3.2(1000, survey$y)
plot(y~year, survey, ylab="index", type="b", lty=3)
segments(2006, output$i1bar, 2008, lwd=2)
segments(2009, output$i2bar, 2010, lwd=2)




