library(MuMIn)


### Name: AICc
### Title: Second-order Akaike Information Criterion
### Aliases: AICc
### Keywords: models

### ** Examples

#Model-averaging mixed models
## Don't show: 
 if(require(nlme)) {
oop <- 
## End(Don't show)
options(na.action = "na.fail")

data(Orthodont, package = "nlme")

# Fit model by REML
fm2 <- lme(distance ~ Sex*age, data = Orthodont,
    random = ~ 1|Subject / Sex, method = "REML")

# Model selection: ranking by AICc using ML
ms2 <- dredge(fm2, trace = TRUE, rank = "AICc", REML = FALSE)

(attr(ms2, "rank.call"))

# Get the models (fitted by REML, as in the global model)
fmList <- get.models(ms2, 1:4)

# Because the models originate from 'dredge(..., rank = AICc, REML = FALSE)',
# the default weights in 'model.avg' are ML based:
summary(model.avg(fmList))

## Not run: 
##D # the same result:
##D model.avg(fmList, rank = "AICc", rank.args = list(REML = FALSE))
## End(Not run)
## Don't show: 
 } 
## End(Don't show)



