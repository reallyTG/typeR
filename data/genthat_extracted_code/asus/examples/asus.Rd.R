library(asus)


### Name: asus
### Title: Adaptive SURE thresholding with side information (asus)
### Aliases: asus

### ** Examples

library(asus)
set.seed(42)
d<-rnorm(10,2,1)
v.d<- rep(1,10)
set.seed(42)
s<-rnorm(10,3,0.1)
asus.out<-asus(d,v.d,s)




