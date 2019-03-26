library(POT)


### Name: bvgpd
### Title: Parametric Bivariate GPD
### Aliases: rbvgpd pbvgpd
### Keywords: distribution

### ** Examples

x <- rbvgpd(1000, alpha = 0.25, model = "log", mar1 = c(0,1,0.25), mar2
= c(2,0.5, -0.15))
y <- rbvgpd(1000, alpha = 0.75, model = "nlog", mar1 = c(0,1,0.25), mar2
= c(2,0.5, -0.15))
par(mfrow=c(1,2))
plot(x);plot(y)



