library(medflex)


### Name: neImpute.formula
### Title: Expand the dataset and impute nested counterfactual outcomes
### Aliases: neImpute.formula

### ** Examples

data(UPBdata)

## example using glm imputation model with binary exposure
impData <- neImpute(UPB ~ factor(attbin) + negaff + gender + educ + age, 
                    family = binomial, data = UPBdata)
head(impData)

## example using glm imputation model with continuous exposure
impData <- neImpute(UPB ~ att + negaff + gender + educ + age, 
                    family = binomial, data = UPBdata, nRep = 2)
head(impData)

## example using vglm (yielding identical results as with glm)
library(VGAM)
impData2 <- neImpute(UPB ~ att + negaff + gender + educ + age, 
                     family = binomialff, data = UPBdata, 
                     nRep = 2, FUN = vglm)
head(impData2)



