library(DiscreteInverseWeibull)


### Name: Discrete Inverse Weibull
### Title: The discrete inverse Weibull distribution
### Aliases: ddiweibull pdiweibull qdiweibull rdiweibull
### Keywords: distribution

### ** Examples

# Ex.1
x<-1:10
q<-0.6
beta<-0.8
ddiweibull(x, q, beta)
t<-qdiweibull(0.99, q, beta)
t
pdiweibull(t, q, beta)
# Ex.2
q<-0.4
beta<-1.7
n<-100
x<-rdiweibull(n, q, beta)
tabulate(x)/sum(tabulate(x))
y<-1:round(max(x))
# compare with
ddiweibull(y, q, beta)



