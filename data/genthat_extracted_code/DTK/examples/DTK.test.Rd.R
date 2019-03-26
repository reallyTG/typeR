library(DTK)


### Name: DTK.test
### Title: Dunnett's Modified Tukey-Kramer Pairwise Multiple Comparison
###   Test
### Aliases: DTK.test

### ** Examples

x=c(rnorm(25,5,2),rnorm(30,5,5),rnorm(35,15,5))
f<-gl.unequal(n=3,k=c(25,30,35))
DTK.result<-DTK.test(x=x,f=f,a=0.05)
DTK.result
DTK.plot(DTK.result)



