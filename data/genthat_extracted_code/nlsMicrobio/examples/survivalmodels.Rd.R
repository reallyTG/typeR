library(nlsMicrobio)


### Name: survivalmodels
### Title: Bacterial survival models
### Aliases: survivalmodels geeraerd geeraerd_without_Nres
###   geeraerd_without_Sl mafart albert trilinear bilinear_without_Nres
###   bilinear_without_Sl
### Keywords: models

### ** Examples


# Example 1

data(survivalcurve1)
nls1a <- nls(geeraerd, survivalcurve1,
	list(Sl = 5, kmax = 1.5, LOG10N0 = 7, LOG10Nres = 1))
nls1b <- nls(trilinear, survivalcurve1,
	list(Sl = 5, kmax = 1.5, LOG10N0 = 7, LOG10Nres = 1))
nls1c <- nls(albert,survivalcurve1,
	list(p = 1.2, delta = 4, LOG10N0 = 7, LOG10Nres = 1))
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2,2))
overview(nls1a)
plotfit(nls1a, smooth = TRUE)
overview(nls1b)
plotfit(nls1b, smooth = TRUE)
overview(nls1c)
plotfit(nls1c, smooth = TRUE)
par(def.par)

# Example 2

data(survivalcurve2)
nls2a <- nls(geeraerd_without_Nres, survivalcurve2,
	list(Sl = 10, kmax = 1.5, LOG10N0 = 7.5))
nls2b <- nls(bilinear_without_Nres, survivalcurve2, 
	list(Sl = 10, kmax = 1.5, LOG10N0 = 7.5))
nls2c <- nls(mafart, survivalcurve2,
	list(p = 1.5, delta = 8, LOG10N0 = 7.5))
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2,2))
overview(nls2a)
plotfit(nls2a, smooth = TRUE)
overview(nls2b)
plotfit(nls2b, smooth = TRUE)
overview(nls2c)
plotfit(nls2c, smooth = TRUE)
par(def.par)

# Example 3

data(survivalcurve3)
nls3a <- nls(geeraerd_without_Sl, survivalcurve3,
	list(kmax = 4, LOG10N0 = 7.5, LOG10Nres = 1))
nls3b <- nls(bilinear_without_Sl, survivalcurve3,
	list(kmax = 4, LOG10N0 = 7.5, LOG10Nres = 1))
nls3c <- nls(mafart, survivalcurve3,
	list(p = 0.5, delta = 0.2, LOG10N0 = 7.5))
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2,2))
overview(nls3a)
plotfit(nls3a, smooth = TRUE)
overview(nls3b)
plotfit(nls3b, smooth = TRUE)
overview(nls3c)
plotfit(nls3c, smooth = TRUE)
par(def.par)





