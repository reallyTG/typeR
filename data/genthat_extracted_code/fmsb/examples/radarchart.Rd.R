library(fmsb)


### Name: radarchart
### Title: Drawing radar chart (a.k.a. spider plot)
### Aliases: radarchart

### ** Examples

# Data must be given as the data frame, where the first cases show maximum.
maxmin <- data.frame(
 total=c(5, 1),
 phys=c(15, 3),
 psycho=c(3, 0),
 social=c(5, 1),
 env=c(5, 1))
# data for radarchart function version 1 series, minimum value must be omitted from above.
RNGkind("Mersenne-Twister")
set.seed(123)
dat <- data.frame(
 total=runif(3, 1, 5),
 phys=rnorm(3, 10, 2),
 psycho=c(0.5, NA, 3),
 social=runif(3, 1, 5),
 env=c(5, 2.5, 4))
dat <- rbind(maxmin,dat)
op <- par(mar=c(1, 2, 2, 1),mfrow=c(2, 2))
radarchart(dat, axistype=1, seg=5, plty=1, vlabels=c("Total\nQOL", "Physical\naspects", 
 "Phychological\naspects", "Social\naspects", "Environmental\naspects"), 
 title="(axis=1, 5 segments, with specified vlabels)", vlcex=0.5)
radarchart(dat, axistype=2, pcol=topo.colors(3), plty=1, pdensity=c(5, 10, 30), 
 pangle=c(10, 45, 120), pfcol=topo.colors(3), 
 title="(topo.colors, fill, axis=2)")
radarchart(dat, axistype=3, pty=32, plty=1, axislabcol="grey", na.itp=FALSE,
 title="(no points, axis=3, na.itp=FALSE)")
radarchart(dat, axistype=1, plwd=1:5, pcol=1, centerzero=TRUE, 
 seg=4, caxislabels=c("worst", "", "", "", "best"),
 title="(use lty and lwd but b/w, axis=1,\n centerzero=TRUE, with centerlabels)")
par(op)



