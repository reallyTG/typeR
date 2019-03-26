library(vcrpart)


### Name: tvcolmm
### Title: Tree-based varying coefficient regression based on ordinal and
###   nominal two-stage linear mixed models.
### Aliases: tvcolmm tvcolmm_control
### Keywords: tree

### ** Examples

## ------------------------------------------------------------------- # 
## Example: Moderated effect effect of unemployment
##
## Here we fit a varying coefficient ordinal linear mixed on the 
## synthetic ordinal longitudinal data 'unemp'. The interest is whether 
## the effect of unemployment 'UNEMP' on happiness 'GHQL' is moderated 
## by 'AGE', 'FISIT', 'GENDER' and 'UEREGION'. 'FISIT' is the only true  
## moderator. For the the partitioning we coefficient constancy tests,
## as described in Buergin and Ritschard (2015)
## ------------------------------------------------------------------- #

data(unemp)

## fit the model
model.UE <-
  tvcolmm(GHQL ~ -1 + 
          vc(AGE, FISIT, GENDER, UEREGION, by = UNEMP, intercept = TRUE) +
          re(1|PID), data = unemp)

## diagnosis
plot(model.UE, "coef")
summary(model.UE)
splitpath(model.UE, steps = 1, details = TRUE)



