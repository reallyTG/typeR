library(gamlss.inf)


### Name: term.plotZadj
### Title: Plot regression terms for a specified parameter of a fitted
###   gamlssZadj object
### Aliases: term.plotZadj
### Keywords: regression

### ** Examples


set.seed(3210)
x <- (runif(1000)*4)-2
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
y0 <- rZAGA(1000, mu=fmu(x), sigma=fsigma(x), nu=fnu(x))
da <- data.frame(y0,x)
g0p <- gamlss(y0~pb(x), sigma.fo=~pb(x), nu.fo=~pb(x), data=da, family=ZAGA)
t0p <- gamlssZadj(y=y0, mu.fo=~pb(x), sigma.fo=~pb(x),data=da,
                  trace=TRUE, xi0.fo=~pb(x), family="GA")

# term.plot for the mu parameter
term.plot(g0p);title("gamlss")
term.plot(t0p$dist,"mu");title("gamlssZadj")
term.plotZadj(t0p,"mu",col.shaded = 3);title("gamlssZadj")



# term.plot for the sigma parameter
term.plot(g0p, "sigma");title("gamlss")
term.plot(t0p$dist,"sigma");title("gamlssZadj")
term.plotZadj(t0p,"sigma",col.shaded = 3);title("gamlssZadj")

# term.plot for the binomial parameter
term.plot(g0p, "nu");title("gamlss")
term.plot(t0p$binom,"mu");title("gamlssZadj")
term.plotZadj(t0p,"xi0",col.shaded = 3);title("gamlssZadj")





