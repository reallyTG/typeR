library(poliscidata)


### Name: fit.svyglm
### Title: Calculates model fit statistics for a svyglm weighted regression
###   model
### Aliases: fit.svyglm

### ** Examples

   library(poliscidata)
   
   obamaThermModel <- svyglm(obama_therm ~ gender, design=nesD, na.action="na.omit")
   summary(obamaThermModel)
   fit.svyglm(obamaThermModel)



