library(medflex)


### Name: neModel
### Title: Fit a natural effect model
### Aliases: neModel

### ** Examples

data(UPBdata)

##############################
## weighting-based approach ##
##############################
weightData <- neWeight(negaff ~ att + gender + educ + age, 
                       data = UPBdata)

## stratum-specific natural effects
# bootstrap SE
## Not run: 
##D weightFit1b <- neModel(UPB ~ att0 * att1 + gender + educ + age, 
##D                        family = binomial, expData = weightData)
##D summary(weightFit1b)
## End(Not run)
# robust SE
weightFit1r <- neModel(UPB ~ att0 * att1 + gender + educ + age, 
                       family = binomial, expData = weightData, se = "robust")
summary(weightFit1r)

## population-average natural effects
expFit <- glm(att ~ gender + educ + age, data = UPBdata)
# bootstrap SE
## Not run: 
##D weightFit2b <- neModel(UPB ~ att0 * att1, family = binomial, 
##D                        expData = weightData, xFit = expFit)
##D summary(weightFit2b)
## End(Not run)
# robust SE
weightFit2r <- neModel(UPB ~ att0 * att1, family = binomial, 
                       expData = weightData, xFit = expFit, se = "robust")
summary(weightFit2r)

###############################
## imputation-based approach ##
###############################
impData <- neImpute(UPB ~ att * negaff + gender + educ + age, 
                    family = binomial, data = UPBdata)

## stratum-specific natural effects
# bootstrap SE
## Not run: 
##D impFit1b <- neModel(UPB ~ att0 * att1 + gender + educ + age, 
##D                     family = binomial, expData = impData)
##D summary(impFit1b)
## End(Not run)
# robust SE
impFit1r <- neModel(UPB ~ att0 * att1 + gender + educ + age, 
                    family = binomial, expData = impData, se = "robust")
summary(impFit1r)

## population-average natural effects
# bootstrap SE
## Not run: 
##D impFit2b <- neModel(UPB ~ att0 * att1, family = binomial, 
##D                     expData = impData, xFit = expFit)
##D summary(impFit2b)
## End(Not run)
# robust SE
impFit2r <- neModel(UPB ~ att0 * att1, family = binomial, 
                    expData = impData, xFit = expFit, se = "robust")
summary(impFit2r)

## Don't show: 
# check with vgam (VGAM package)
# library(VGAM)
# weightData <- neWeight(negaff ~ att + gender + educ + age, family = "gaussianff", data = UPBdata, FUN = vgam)
# impData <- neImpute(UPB ~ att + negaff + gender + educ + age, family = "binomialff", data = UPBdata, FUN = vgam)
# debug(neModel)
# weightFit <- neModel(UPB ~ att0 + att1 + gender + educ + age, family = binomial, expData = weightData, nBoot = 2)
# impFit <- neModel(UPB ~ att0 + att1 + gender + educ + age, family = binomial, expData = impData, nBoot = 2)
# summary(weightFit)
# summary(impFit)

# warning!
impFit <- neModel(UPB ~ att0 * att1 + gender + educ + age, family = binomial, expData = impData, nBoot = 2)

# inverse propensity score weighting
expFit <- glm(att ~ gender + educ + age, data = UPBdata)
impFit <- neModel(UPB ~ att0 + att1, family = binomial, expData = impData, xFit = expFit, nBoot = 2)
## End(Don't show)



