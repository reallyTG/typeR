library(MPS)


### Name: mog
### Title: Marshall-Olkin G distribution
### Aliases: dmog pmog qmog rmog mpsmog

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dmog(x, "weibull", c(0.5,2,2,3))
pmog(x, "weibull", c(0.5,2,2,3))
qmog(runif(100), "weibull", c(0.5,2,2,3))
rmog(100, "weibull", c(0.5,2,2,3))
mpsmog(x, "weibull", TRUE, "Nelder-Mead", 0.05)



