library(gamlss.inf)


### Name: predict.gamlssZadj
### Title: Extract Predictor Values and Standard Errors For New Data in a
###   gamlssZadj Model
### Aliases: predict.gamlssZadj
### Keywords: regression

### ** Examples


set.seed(3210)
x <- (runif(800)*4)-2
data(sda)
fmu <- splinefun(sda$x, sda$mu)
curve(fmu, -2,2)
fsigma <- splinefun(sda$x, sda$sigma)
curve(fsigma, -2,2)
fnu <- function(x)
  {f <- splinefun(sda$x, sda$nu)
f(x)/6
}
curve(fnu, -2,2)
set.seed(321)
y0 <- rZAGA(800, mu=fmu(x), sigma=fsigma(x), nu=fnu(x))
da <- data.frame(y0,x)
g0p <- gamlss(y0~pb(x), sigma.fo=~pb(x), nu.fo=~pb(x), data=da, family=ZAGA)
t0p <- gamlssZadj(y=y0, mu.fo=~pb(x), sigma.fo=~pb(x),data=da,
                  trace=TRUE, xi0.fo=~pb(x), family="GA")

plot(predict(g0p,"nu",type="link"),
     predict(t0p,"xi0",type="link")) 



