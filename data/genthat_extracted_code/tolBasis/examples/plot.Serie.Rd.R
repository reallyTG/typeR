library(tolBasis)


### Name: plot.Serie
### Title: Serie Plotting
### Aliases: plot.Serie

### ** Examples

s1 <- Serie(rnorm(18), Monthly, Date(2001))
s2 <- Serie(rnorm(12), Monthly, Date(2002))
plot(s1, s2)
plot(s1, s2, style="TOL")
plot(s1, s2, from=Date(2001,7), dating=Monthly, 
  style="TOL", axes.lwd=2, bg="snow2", 
  axes.font.axis=c(3,1), title.main="Example")
plot(s1, s2, s1-s2, dating=Quarterly, date.format="%m'%y", 
  mar=c(3,3,2,2), lines.col=rainbow(5), lines.lwd=2)
plot(s1, s2, style="TOL", mar=c(6,4,2,2), 
  legend.names=c("s1", "s2"))
plot(s1, s2, dating=Quarterly, date.format="%Y\n%m", 
  axes.mgp=list(c(3,2,0),c(3,1,0)), las=1)



