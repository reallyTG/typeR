library(descomponer)


### Name: periodograma
### Title: Periodogram
### Aliases: periodograma
### Keywords: smooth

### ** Examples

n<-100;x<-seq(0,24*pi,length=n);y<-sin(x)+rnorm(n,sd=.3)
periodograma(y)



