library(medflex)


### Name: neImpute.default
### Title: Expand the dataset and impute nested counterfactual outcomes
### Aliases: neImpute.default

### ** Examples

data(UPBdata)

## example using glm imputation model with binary exposure
fit.glm <- glm(UPB ~ factor(attbin) + negaff + gender + educ + age, 
               family = binomial, data = UPBdata)
impData <- neImpute(fit.glm)
head(impData)

## example using glm imputation model with continuous exposure
fit.glm <- glm(UPB ~ att + negaff + gender + educ + age, 
               family = binomial, data = UPBdata)
impData <- neImpute(fit.glm, nRep = 2)
head(impData)

## example using vglm (yielding identical results as with glm)
library(VGAM)
fit.vglm <- vglm(UPB ~ att + negaff + gender + educ + age, 
                 family = binomialff, data = UPBdata)
impData2 <- neImpute(fit.vglm, nRep = 2)
head(impData2)

## Not run: 
##D ## example using SuperLearner
##D library(Matrix)
##D library(SuperLearner)
##D SL.library <- c("SL.glm", "SL.glm.interaction", "SL.rpart",
##D                 "SL.step", "SL.stepAIC", "SL.step.interaction",
##D                 "SL.bayesglm", "SL.glmnet")
##D pred <- c("att", "negaff", "gender", "educ", "age")
##D fit.SL <- SuperLearner(Y = UPBdata$UPB, X = subset(UPBdata, select = pred),
##D                        SL.library = SL.library, family = binomial())
##D impSL <- neImpute(fit.SL, 
##D                   formula = UPB ~ att + negaff + gender + educ + age, 
##D                   data = UPBdata)
##D head(impSL)
## End(Not run)

## Don't show: 
rm(list=ls())
library(VGAM) 
expData <- neImpute(UPB ~ factor(attbin) + negaff + gender + educ + age, family = binomialff, data = UPBdata, FUN = vglm)
neMod <- neModel(UPB ~ attbin0 + attbin1 + gender + educ + age, family = binomial, expData = expData, nBoot = 2)

UPBdata$att2 <- ifelse(UPBdata$attbin == "H", 1, 0)
UPBdata$att2 <- UPBdata$attbin
impData <- neImpute(UPB ~ factor(att2) * negaff + gender + educ + age, family = binomial, data = UPBdata)
impFit1 <- neModel(UPB ~ att20 * att21 + gender + educ + age, family = binomial, expData = impData, nBoot = 2)
impFit2 <- neModel(UPB ~ factor(att20) * factor(att21) + gender + educ + age, family = binomial, expData = impData, nBoot = 2)
summary(impFit1)
summary(impFit2)

head(neImpute(UPB ~ att + negaff + gender + educ + age, data = UPBdata, weights = rep(1, nrow(UPBdata))))
fit1 <- vglm(UPB ~ att + negaff + gender + educ + age, family = binomialff, data = UPBdata)
head(neImpute(fit1))
head(neImpute(UPB ~ att + negaff + gender + educ + age, family = binomialff, data = UPBdata, FUN = vglm, weights = rep(1, nrow(UPBdata))))
head(neImpute(UPB ~ att + negaff + gender + educ + age, family = binomial, data = UPBdata, weights = rep(1, nrow(UPBdata))))
UPBdata$att <- factor(cut(UPBdata$att, 2), labels = c("low", "high"))
fit2 <- glm(UPB ~ att * negaff * gender * educ * age, family = binomial, data = UPBdata)
# head(neImpute(fit2, nMed = 3, joint = FALSE))
# head(neImpute(UPB ~ att * negaff * gender * educ * age, data = UPBdata, family = binomial, nMed = 3, joint = FALSE))
head(neImpute(UPB ~ att + negaff + gender + educ + age, data = UPBdata, family = binomial))
head(neImpute(UPB ~ att + negaff + gender + educ + age, data = UPBdata))

# # test with vglm!
library(VGAM)
impFit <- vglm(UPB ~ att + negaff + gender + educ + age, family = binomialff, data = UPBdata)
terms(impFit)
# debug(neImpute)
impData <- neImpute(impFit)
impFit2 <- glm(UPB ~ att + negaff + gender + educ + age, family = binomial, data = UPBdata)
impData2 <- neImpute(impFit2)
head(impData); head(impData2)
# check!!

# test with gam?
library(gam)
impFit4 <- gam(UPB ~ att + negaff + gender + educ + age, family = binomial, data = UPBdata)
impData4 <- neImpute(impFit4)
head(impData2); head(impData4)
# check!
## End(Don't show)



