library(epade)


### Name: parallel.ade
### Title: Parallel coordinate plot
### Aliases: parallel.ade
### Keywords: parallel

### ** Examples

x1<-rnorm(1000, 0, 5)
x2<-rnorm(1000, 0, 4)
x3<-rnorm(1000, 0, 3)
x4<-rnorm(1000, 0, 2)
parallel.ade(vars=list(x1, x2, x3, x4))
g<-rbinom(1000, 1, 0.5)
x1[g==1]<- x1[g==1]+8
x2[g==1]<- x2[g==1]-8
x3[g==1]<- x3[g==1]+6
x4[g==1]<- x4[g==1]-6
parallel.ade(vars=list(x1, x2, x3, x4), group=g,wall=3)



