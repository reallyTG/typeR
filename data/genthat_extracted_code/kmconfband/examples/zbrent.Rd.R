library(kmconfband)


### Name: zbrent
### Title: Van Wijngaarden-Decker-Brent Root-finding Algorithm
### Aliases: zbrent

### ** Examples

f<-function(x) x*(x^2-1)+0.5
x<-seq(-2,2,length=100)
plot(x,f(x),type="l")
zbrent(f,c(-2,2),1.0e-10)



