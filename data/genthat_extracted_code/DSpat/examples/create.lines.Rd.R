library(DSpat)


### Name: create.lines
### Title: Create a systematic sample of parallel lines across a grid
### Aliases: create.lines

### ** Examples

study.area=owin(xrange=c(0,100),yrange=c(0,100))
xp=create.lines(study.area,nlines=10,width=5,angle=180)
ls=lines_to_strips(xp,study.area)
plot(ls$lines,lty=2)
plot(owin(poly=ls$transects),add=TRUE)



