library(seroincidence)


### Name: estimateSeroincidence
### Title: Estimate Seroincidence
### Aliases: estimateSeroincidence

### ** Examples


## Not run: 
##D estimateSeroincidence(data = csData,
##D                       antibodies = c("IgG", "IgM", "IgA"),
##D                       strata = "",
##D                       params = campylobacterDelftParams4,
##D                       censorLimits = cutOffs,
##D                       par0 = baseLn,
##D                       start = -4)
##D 
##D estimateSeroincidence(data = csData,
##D                       antibodies = c("IgG", "IgM", "IgA"),
##D                       strata = "",
##D                       params = campylobacterDelftParams4,
##D                       censorLimits = cutOffs,
##D                       par0 = baseLn,
##D                       start = -4,
##D                       numCores = parallel::detectCores())
## End(Not run)




