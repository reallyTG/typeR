library(descomponer)


### Name: gdt
### Title: Get Time Data
### Aliases: gdt
### Keywords: smooth

### ** Examples

n<-100;x<-seq(0,24*pi,length=n);y<-sin(x)+rnorm(n,sd=.3)
coef <- gdf(y)
gdt(coef)



