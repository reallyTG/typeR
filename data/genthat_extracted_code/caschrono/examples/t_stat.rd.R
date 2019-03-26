library(caschrono)


### Name: t_stat
### Title: Arima coefficients tests
### Aliases: t_stat
### Keywords: ts

### ** Examples

if(require("forecast"))
{set.seed(123)
y1 = arima.sim(n=100,list(ar=-.7), sd=sqrt(4))
my1 = Arima(y1, order=c(1,0,0),include.mean = FALSE)
t_stat(my1)
}



