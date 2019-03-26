library(emon)


### Name: power.BACI
### Title: Calculates power for a Before and After Control Impact (BACI)
###   design.
### Aliases: power.BACI

### ** Examples


# Data is richness (number of species) and abundance from grab samples from
# the Dogger Bank, UK. In practice, \code{nsims} would be set to at least 1000.

rich = c(15,16,37,12,15,5,13,16,17,34,23,20,22,30,85,55,13,19,30,41,22,8,43,10,38,24,17,
         23,17,17,24,33,30,18,26,18,12,50,19,21,35)
abun = c(50,91,140,21,25,8,28,37,30,90,56,50,40,83,964,180,21,60,81,138,67,17,250,63,152,
         68,42,69,57,67,74,96,75,44,61,49,62,281,55,50,198)

par(mfrow=c(2,2))
hist(rich)
hist(abun)
hist(sqrt(rich))
hist(log(abun))

ssize = seq(10, 50, 10)
parsc.rich = mean(rich); parst.rich = mean(rich)
parsc.abun = rep(0,2); parst.abun = parsc.abun
parst.abun[1] = mean(log(abun)); parst.abun[2] = sd(log(abun))
parsc.abun = parst.abun
power.rich = rep(0, length(ssize))
power.abun = rep(0, length(ssize))

power.rich = power.BACI(change=35, change.type="M", nt=ssize, nc=ssize,
                parst=parst.rich, parsc=parsc.rich,
                distribution="Poisson", test="P", nsims=50)$power

power.abun = power.BACI(change=35, change.type="M", nt=ssize, nc=ssize,
                parst=parst.abun, parsc=parsc.abun, distribution="Lognormal",
                test="P", nsims=50)$power

par(mfrow=c(1,1))
plot(ssize, power.rich, ylim=c(0,1), ylab="Power", xlab="Sample size", type="l")
lines(ssize, power.abun, lty=2, col=2)
legend("bottomright", legend=c("Richness power", "Abundance power"), lty=c(1,2),
       col=c(1,2))
title("BACI power plots")



