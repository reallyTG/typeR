library(nlsMicrobio)


### Name: growthmodels
### Title: Bacterial growth models
### Aliases: growthmodels baranyi baranyi_without_Nmax baranyi_without_lag
###   buchanan buchanan_without_Nmax buchanan_without_lag gompertzm
### Keywords: models

### ** Examples


# Example 1

data(growthcurve1)
nls1 <- nls(baranyi, growthcurve1,
	list(lag=4, mumax=1, LOG10N0 = 4, LOG10Nmax = 9))
nls2 <- nls(gompertzm,growthcurve1,
	list(lag = 4, mumax = 1, LOG10N0 = 4, LOG10Nmax = 9))
nls3 <- nls(buchanan, growthcurve1,
	list(lag = 4, mumax = 1, LOG10N0 = 4, LOG10Nmax = 9))
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2,2))
plotfit(nls1, smooth = TRUE)
plotfit(nls2, smooth = TRUE)
plotfit(nls3, smooth = TRUE)
par(def.par)

# Example 2

data(growthcurve2)
nls4 <- nls(baranyi_without_Nmax, growthcurve2,
	list(lag = 2, mumax = 0.4, LOG10N0 = 7.4))
nls5 <- nls(buchanan_without_Nmax,growthcurve2,
	list(lag = 2, mumax = 0.4, LOG10N0 = 7.4))
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2,1))
plotfit(nls4, smooth = TRUE)
plotfit(nls5, smooth = TRUE)
par(def.par)

# Example 3

data(growthcurve3)
nls6 <- nls(baranyi_without_lag, growthcurve3,
	list(mumax = 1, LOG10N0 = 0, LOG10Nmax = 5))
nls7 <- nls(buchanan_without_lag, growthcurve3,
	list(mumax = 1, LOG10N0 = 0, LOG10Nmax = 5))
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2,1))
plotfit(nls6, smooth = TRUE)
plotfit(nls7, smooth = TRUE)
par(def.par)
 


