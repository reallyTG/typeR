library(DTK)


### Name: TK.test
### Title: Tukey's Honestly Significant Difference Test
### Aliases: TK.test

### ** Examples

x=c(rnorm(25,5,2),rnorm(30,5,5),rnorm(35,15,5))
f<-gl.unequal(n=3,k=c(25,30,35))
DTK.result<-DTK.test(x=x,f=f,a=0.05)
TK.result<-TK.test(x=x,f=f,a=0.05)
DTK.result
TK.result



