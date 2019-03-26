library(gppm)


### Name: fitted.GPPM
### Title: Person-specific mean vectors and covariance matrices
### Aliases: fitted.GPPM

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
lgcmFit <- fit(lgcm)
meansCovs <- fitted(lgcmFit)

person1Mean <- meansCovs$mean[[1]]
person1Cov <- meansCovs$cov[[1]]
person1ID <- meansCovs$ID[[1]]
## End(No test)



