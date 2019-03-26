library(DoseFinding)


### Name: neurodeg
### Title: Neurodegenerative disease simulated longitudinal dose-finding
###   data set
### Aliases: neurodeg
### Keywords: datasets

### ** Examples

## Not run: 
##D ## reproduce analysis from Pinheiro et al. (2013)
##D data(neurodeg)
##D ## first fit the linear mixed effect model
##D library(nlme)
##D fm <- lme(resp ~ as.factor(dose):time, neurodeg, ~time|id)
##D muH <- fixef(fm)[-1] # extract estimates
##D covH <- vcov(fm)[-1,-1]
##D 
##D ## derive optimal contrasts for candidate shapes
##D doses <- c(0, 1, 3, 10, 30)
##D mod <- Mods(emax = 1.11, quadratic= -0.022, exponential = 8.867,
##D             linear = NULL, doses = doses) # 
##D contMat <- optContr(mod, S=covH) # calculate optimal contrasts
##D ## multiple contrast test
##D MCTtest(doses, muH, S=covH, type = "general", critV = TRUE,
##D         contMat=contMat)
##D ## fit the emax model
##D fitMod(doses, muH, S=covH, model="emax", type = "general",
##D        bnds=c(0.1, 10))
##D 
##D 
##D ## alternatively one can also fit the model using nlme
##D nlme(resp ~ b0 + (e0 + eM * dose/(ed50 + dose))*time, neurodeg,
##D      fixed = b0 + e0 + eM + ed50 ~ 1, random = b0 + e0 ~ 1 | id,
##D      start = c(200, -4.6, 1.6, 3.2))
##D ## both approaches lead to rather similar results
## End(Not run)



