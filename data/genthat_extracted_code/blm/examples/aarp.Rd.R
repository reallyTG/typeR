library(blm)


### Name: aarp
### Title: Nested case-control data set of bladder cancer in the NIH-AARP
###   Diet and Health Study
### Aliases: aarp
### Keywords: datasets

### ** Examples


data(aarp)

# ABSOLUTE RISK OF BLADDER CANCER BY 70 YEARS
# FOR DIFFERENT GENDER AND RISK GROUP

fit <- blm(bladder70~female * smoke_status, 
			      data = aarp, 
			      weight=aarp$w)

# INTERCEPT IS BASELINE RISK
# ALL OTHER COEFFICIENTS ARE RISK DIFFERENCES FROM BASELINE

summary(fit)





