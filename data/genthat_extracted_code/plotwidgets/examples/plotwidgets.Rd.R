library(plotwidgets)


### Name: plotwidgets
### Title: Plot widgets
### Aliases: plotWidget plotwidgets plotwidgets-package wgBarplot wgBoxpie
###   wgBurst wgPie wgPlanets wgRing wgRoccurve wgRug wgSpider

### ** Examples

# demonstration of the three widgets
plot.new()
par(usr=c(0,3,0,3))
v <- c(7, 5, 11)
col <- plotPals("safe")
b <- "black"
wgRug(0.5, 1.5, 0.8, 0.8, v=v, col=col, border=b)
wgPie(1.5, 1.5, 0.8, 0.8, v=v, col=col, border=b)
wgBoxpie(2.5, 1.5, 0.8, 0.8, v=v, col=col, border=b)

# using pie as plotting symbol
plot(NULL, xlim=1:2, ylim=1:2, xlab="", ylab="")
col <- c("#cc000099", "#0000cc99")
for(i in 1:125) { 
  x <- runif(1) + 1 
  y <- runif(1) + 1
  wgPie( x, y, 0.05, 0.05, c(x,y), col)
}

# square filled with box pies
n <- 10 
w <- h <- 1/(n+1)
plot.new()
for(i in 1:n) for(j in 1:n) 
 wgBoxpie(x=1/n*(i-1/2), y=1/n*(j-1/2), w, h, 
 v=runif(3), col=plotPals("zeileis"))



