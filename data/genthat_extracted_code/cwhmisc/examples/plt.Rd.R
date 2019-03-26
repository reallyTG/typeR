library(cwhmisc)


### Name: plt
### Title: Plot depending on switch, Create multiple plots with title and
###   time stamp
### Aliases: pltCharMat pltRCT histRCT
### Keywords: hplot

### ** Examples

  x <- rnorm(100); y <- rnorm(100)+1; z <- y+rlnorm(100)
  pltRCT(1,1,f={plot(x,y,xlab="data with trend");
    abline(reg=lm(y~x),lty=2);points(x,z,pch=3)})
  nr <- 100; nc <- 8;
  pltRCT(1, 1, tit="1 by 1 plot", f=plot(y,x-3*y) )
  nr <- 25;  nc <- 16
  pltRCT(1, 2, f={plot(x,y,xlab="my x")
    m <- matrix(rnorm(nr*nc),nrow=25,ncol=nc)
    pltCharMat(m,cex=0.5,col="red")
  })




