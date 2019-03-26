library(hotspots)


### Name: hotspots
### Title: Hot spots and outliers
### Aliases: hotspots-package hotspots outliers print.hotspots

### ** Examples

#basic operation on lognormal data
rln100 <- hotspots(rlnorm(100))
summary(rln100)
plot(rln100)

#greater skew in data
rln100sd2 <- hotspots(rlnorm(100,sd=2))
print(summary(rln100sd2),top = 5)
plot(rln100sd2)

#both tails on normally distributed data
n100 <- hotspots(rnorm(100), tail = "both")
summary(n100)
plot(n100)

#both tails on skewed data
rln100pn <- hotspots(c(rlnorm(50),rlnorm(50)*-1),tail = "both")
summary(rln100pn)
plot(rln100pn)

#importance of disproportionality on normally distributed data
#contrast with n100
n100p3 <- hotspots(n100$x+3, tail = "both")
summary(n100p3)
plot(n100p3)

#importance of disproportionality on skewed data
#contrast with rln100
rln100p10 <- hotspots(rlnorm(100)+10)
summary(rln100p10)
plot(rln100p10)

#outliers function ignores disproportionality 
rln100p10o <- outliers(rlnorm(100)+10)
summary(rln100p10o)
plot(rln100p10o)

#some alternative parameters
rln100a <- hotspots(rlnorm(100), p = 0.9, distribution = "normal",  var.est = "sd")
summary(rln100a)
plot(rln100a)




