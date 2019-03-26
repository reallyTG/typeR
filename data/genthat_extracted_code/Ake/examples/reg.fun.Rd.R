library(Ake)


### Name: reg.fun
### Title: Function for associated kernel estimation of regression
### Aliases: reg.fun reg.fun.default

### ** Examples

data(milk)
x=milk$week
y=milk$yield
##The bandwidth is the one obtained by cross validation.
h<-0.10
## We choose binomial kernel.
## Not run: 
##D m_n<-reg.fun(x, y, "discrete",ker="bino", h)
## End(Not run)





