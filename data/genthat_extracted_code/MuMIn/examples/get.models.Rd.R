library(MuMIn)


### Name: get.models
### Title: Retrieve models from selection table
### Aliases: get.models pget.models
### Keywords: models

### ** Examples

# Mixed models:

## Don't show: 
 if(require(nlme)) { 
## End(Don't show)
fm2 <- lme(distance ~ age + Sex, data = Orthodont,
    random = ~ 1 | Subject, method = "ML")
ms2 <- dredge(fm2)

# Get top-most models, but fitted by REML:
(confset.d4 <- get.models(ms2, subset = delta < 4, method = "REML"))

## Not run: 
##D # Get the top model:
##D get.models(ms2, subset = 1)[[1]]
## End(Not run)

## Don't show: 
  } 
## End(Don't show)



