library(SDLfilter)


### Name: ddfilter
### Title: Filter locations using a data driven filter
### Aliases: ddfilter

### ** Examples

#### Load data sets
## Fastloc GPS data obtained from a green turtle
data(turtle)

## A Map for the example site
data(Australia)
data(SandyStrait)


#### Filter temporal and/or spatial duplicates
turtle.dup <- dupfilter(turtle, step.time=5/60, step.dist=0.001)
 

#### ddfilter
## Using the built-in function to estimate the threshold speeds
V <- est.vmax(turtle.dup)
VLP <- est.maxvlp(turtle.dup)
turtle.dd <- ddfilter(turtle.dup, vmax=V, maxvlp=VLP)

## Or using user specified threshold speeds
turtle.dd <- ddfilter(turtle.dup, vmax=9.9, qi=4, ia=90, maxvlp=2.0)


#### Plot data removed or retained by ddfilter
## Entire area
p1<-plotMap(turtle.dup, bgmap=Australia, point.size = 2, line.size = 0.5, axes.lab.size = 0, 
             sb.distance=200, multiplot = FALSE, title.size=15, title="Entire area")[[1]] + 
  geom_point(aes(x=lon, y=lat), data=turtle.dd, size=2, fill="yellow", shape=21)+
  geom_point(aes(x=x, y=y), data=data.frame(x=c(154, 154), y=c(-22, -22.5)), 
             size=3, fill=c("yellow", "red"), shape=21) + 
  annotate("text", x=c(154.3, 154.3), y=c(-22, -22.5), label=c("Retained", "Removed"), 
           colour="black", size=4, hjust = 0)

## Zoomed in
p2<-plotMap(turtle.dup, bgmap=SandyStrait, xlim=c(152.7, 153.2), ylim=(c(-25.75, -25.24)), 
axes.lab.size = 0, sb.distance=10, point.size = 2, line.size = 0.5, multiplot = FALSE, 
title.size=15, title="Zoomed in")[[1]] + 
geom_path(aes(x=lon, y=lat), data=turtle.dd, size=0.5, colour="black", linetype=1) + 
geom_point(aes(x=lon, y=lat), data=turtle.dd, size=2, colour="black", shape=21, fill="yellow")

gridExtra::marrangeGrob(list(p1, p2), nrow=1, ncol=2)



