library(IDPmisc)


### Name: Arrows
### Title: Pretty Open or Closed Arrows
### Aliases: Arrows
### Keywords: aplot

### ** Examples

## a bunch of different arrows
plot(c(0,10), c(0,10), type="n")
Arrows(5, 5, 5,10, size=3,
       sh.lwd=5, sh.lty=2,
       h.lwd=5)
Arrows(5, 5, 7.5, 9, size=3, open=TRUE,
       sh.adj=0.7, sh.lwd=5, sh.lty=2,
       h.col.bo="red",h.lwd=5)
Arrows(5, 5, 9, 7.5, size=3, open=FALSE,
       sh.adj=1, sh.lwd=5, sh.col="blue",
       h.col.bo="red",h.lwd=2)
Arrows(5, 5, 10, 5, size=2.5, width=1.5, open=FALSE,
       sh.adj=1, sh.lwd=7, sh.col="blue")
Arrows(5, 5, 9, 2.5, size=4, open=FALSE,
       sh.lty=0,
       h.col.bo="black",h.lwd=5)
Arrows(5, 5, 7.5, 1)
Arrows(5, 5, 5, 0, size=2)
Arrows(5, 5, 2.5, 1, size=2, width=1)

## vector field
x<- runif( 20)
y<- runif( 20)
u<- 0.1+0.02*rnorm(20)
v<- 0.1+0.02*rnorm(20)
plot(x,y,xlim=range(c(x,x+u)),ylim=range(c(y,y+v)),type="n")
Arrows(x,y,x+u,y+v,sh.col="blue")



