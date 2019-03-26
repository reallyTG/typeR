library(Ake)


### Name: print.reg.fun
### Title: Print for regression function
### Aliases: print.reg.fun
### Keywords: print

### ** Examples

data(milk)
x=milk$week
y=milk$yield
##The bandwidth is the one obtained by cross validation.
h<-0.10
## We choose binomial kernel.
m_n<-reg.fun(x, y, "discrete",ker="bino", h)
print.reg.fun(m_n)



