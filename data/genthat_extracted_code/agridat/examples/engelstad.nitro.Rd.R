library(agridat)


### Name: engelstad.nitro
### Title: Multi-environment trial of corn with nitrogen fertilizer
### Aliases: engelstad.nitro
### Keywords: datasets

### ** Examples


data(engelstad.nitro)
dat <- engelstad.nitro

if(require(latticeExtra)) {
  useOuterStrips(xyplot(yield ~ nitro | factor(year)*loc, dat,
                        main="engelstad.nitro"))
}

# Fit a quadratic plateau model to one year/loc
j62 <- droplevels(subset(dat, loc=="Jackson" & year==1962))
# ymax is maximum yield, M is the change point, k affects curvature
m1 <-  nls(yield ~ ymax*(nitro > M) +
           (ymax - (k/2) * (M-nitro)^2) * (nitro < M),
           data= j62,
           start=list(ymax=80, M=150, k=.01))

# Plot the raw data and model
newdat <- data.frame(nitro=seq(0,max(dat$nitro)))
p1 <- predict(m1, new=newdat)
plot(yield ~ nitro, j62)
lines(p1 ~ newdat$nitro, col="blue")
title("engelstad.nitro: quadratic plateau at Jackson 1962")

# Optimum nitro level ignoring prices = 225
coef(m1)['M']

# Optimum nitro level using $0.11 for N cost, $1.15 for grain price = 140
# Set the first derivative equal to N/corn price, k(M-nitro)=.11/1.15
coef(m1)['M']-(.11/1.15)/coef(m1)['k']




