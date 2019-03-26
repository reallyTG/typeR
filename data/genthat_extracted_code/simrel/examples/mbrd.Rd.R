library(simrel)


### Name: mbrd
### Title: Function to create MBR-design.
### Aliases: mbrd
### Keywords: MBRD Design

### ** Examples

#Two variables with 8 levels each (2^3=8), a half-fraction design.
res <- mbrd(c(3,3),fraction=1, gen=list(c(1,4)))
#plot(res$Design, pch=20, cex=2, col=2)

#Three variabler with 8 levels each, a 1/16-fraction.
res <- mbrd(c(3,3,3),fraction=4)
#library(rgl)
#plot3d(res$Design,type="s",col=2)




