library(strucchange)


### Name: efpFunctional
### Title: Functionals for Fluctuation Processes
### Aliases: efpFunctional simulateBMDist maxBM maxBB maxBMI maxBBI maxL2BB
###   meanL2BB rangeBM rangeBB rangeBMI rangeBBI
### Keywords: regression

### ** Examples


data("BostonHomicide")
gcus <- gefp(homicides ~ 1, family = poisson, vcov = kernHAC,
  data = BostonHomicide)
plot(gcus, functional = meanL2BB)	 
gcus
sctest(gcus, functional = meanL2BB)

y <- rnorm(1000)
x1 <- runif(1000)
x2 <- runif(1000)

## supWald statistic computed by Fstats()
fs <- Fstats(y ~ x1 + x2, from = 0.1)
plot(fs)
sctest(fs)

## compare with supLM statistic
scus <- gefp(y ~ x1 + x2, fit = lm)
plot(scus, functional = supLM(0.1))
sctest(scus, functional = supLM(0.1))

## seatbelt data
data("UKDriverDeaths")
seatbelt <- log10(UKDriverDeaths)
seatbelt <- cbind(seatbelt, lag(seatbelt, k = -1), lag(seatbelt, k = -12))
colnames(seatbelt) <- c("y", "ylag1", "ylag12")
seatbelt <- window(seatbelt, start = c(1970, 1), end = c(1984,12))

scus.seat <- gefp(y ~ ylag1 + ylag12, data = seatbelt)

## double maximum test
plot(scus.seat)
## range test
plot(scus.seat, functional = rangeBB)
## Cramer-von Mises statistic (Nyblom-Hansen test)
plot(scus.seat, functional = meanL2BB)
## supLM test
plot(scus.seat, functional = supLM(0.1))



