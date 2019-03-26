library(surveillance)


### Name: imdepifit
### Title: Example 'twinstim' Fit for the 'imdepi' Data
### Aliases: imdepifit
### Keywords: datasets

### ** Examples

data("imdepi", "imdepifit")

## Not run: 
##D ## reproduce "imdepifit"
##D myimdepifit <- twinstim(
##D     endemic = addSeason2formula(~ offset(log(popdensity)) + I(start/365-3.5),
##D                                 S = 1, period = 365, timevar = "start"),
##D     epidemic = ~ type + agegrp, siaf = siaf.gaussian(),
##D     data = imdepi, subset = !is.na(agegrp),
##D     optim.args = list(control = list(reltol = sqrt(.Machine$double.eps))),
##D     ## the historical default for reltol is 1e-6, which is rather large
##D     model = FALSE, cumCIF = FALSE
##D )
##D stopifnot(all.equal(imdepifit, myimdepifit))
## End(Not run)



