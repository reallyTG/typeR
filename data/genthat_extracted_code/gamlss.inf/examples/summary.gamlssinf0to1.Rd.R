library(gamlss.inf)


### Name: summary.gamlssinf0to1
### Title: Summarizes an inflated GAMLSS fitted model
### Aliases: summary.gamlssinf0to1 summary.gamlssZadj
### Keywords: regression

### ** Examples


# The gamlssZadj example 
set.seed(3210)
x <- (runif(1000)*4)-2
data(sda)
fmu <- splinefun(sda$x, sda$mu)
fsigma <- splinefun(sda$x, sda$sigma)
fnu <- function(x)
  {f <- splinefun(sda$x, sda$nu)
f(x)/6
}
y0 <- rZAGA(1000, mu=fmu(x), sigma=fsigma(x), nu=fnu(x))
da <- data.frame(y0,x)
t0p <- gamlssZadj(y=y0, mu.fo=~pb(x), sigma.fo=~pb(x),data=da,
                  trace=TRUE, xi0.fo=~pb(x), family="GA")
summary(t0p)



