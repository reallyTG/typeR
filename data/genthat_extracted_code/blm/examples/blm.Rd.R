library(blm)


### Name: blm
### Title: Fit a binomial linear regression model
### Aliases: blm

### ** Examples


data(ccdata)

fit <- blm(y~female+packyear, weights = ccdata$w,strata=ccdata$strata,
				data=ccdata)

summary(fit)


data(aarp)

# ABSOLUTE RISK OF BLADDER CANCER BY 70 YEARS
# FOR DIFFERENT GENDER AND RISK GROUP

fit <- blm(bladder70~female * smoke_status, 
			      data = aarp, 
			      weight=aarp$w)

logLik(fit)

# INTERCEPT IS BASELINE RISK
# ALL OTHER COEFFICIENTS ARE RISK DIFFERENCES FROM BASELINE

summary(fit)

# RISK DIFFERENCE CONFIDENCE INTERVALS (PER 1,000 PERSONS)
confint(fit)*1000



