library(StMoMo)


### Name: fit.rh
### Title: Fit a Renshaw and Haberman (Lee-Carter with cohorts) mortality
###   model
### Aliases: fit.rh

### ** Examples


LCfit <-  fit(lc(), data = EWMaleData, ages.fit = 55:89)
wxt <- genWeightMat(55:89,  EWMaleData$years, clip = 3)
RHfit <- fit(rh(), data = EWMaleData, ages.fit = 55:89, 
             wxt = wxt, start.ax = LCfit$ax,
             start.bx = LCfit$bx, start.kt = LCfit$kt)
plot(RHfit)
 
#Impose approximate constraint as in Hunt and Villegas (2015)    
## Not run: 
##D RHapprox <- rh(approxConst = TRUE)
##D RHapproxfit <- fit(RHapprox, data = EWMaleData, ages.fit = 55:89, 
##D                     wxt = wxt)
##D plot(RHapproxfit) 
## End(Not run)




