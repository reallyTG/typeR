library(gnm)


### Name: instances
### Title: Specify Multiple Instances of a Nonlinear Term in a gnm Model
###   Formula
### Aliases: instances
### Keywords: models regression nonlinear

### ** Examples

## Not run: 
##D ## (this example can take quite a while to run)
##D ##
##D ## Fitting two instances of a multiplicative interaction (i.e. a
##D ## two-component interaction)
##D yield.scaled <- wheat$yield * sqrt(3/1000)
##D treatment <- factor(paste(wheat$tillage, wheat$summerCrop, wheat$manure,
##D                           wheat$N, sep = ""))
##D bilinear2 <- gnm(yield.scaled ~ year + treatment +
##D                  instances(Mult(year, treatment), 2),
##D                  family = gaussian, data = wheat)
## End(Not run)



