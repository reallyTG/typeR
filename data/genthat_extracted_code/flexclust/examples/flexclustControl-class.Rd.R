library(flexclust)


### Name: flexclustControl-class
### Title: Classes "flexclustControl" and "cclustControl"
### Aliases: cclustControl flexclustControl flexclustControl-class
###   coerce,list,flexclustControl-method
###   coerce,NULL,flexclustControl-method cclustControl-class
###   coerce,list,cclustControl-method coerce,NULL,cclustControl-method
### Keywords: classes

### ** Examples

## have a look at the defaults
new("flexclustControl")

## corce a list
mycont <- list(iter=500, tol=0.001, class="w")
as(mycont, "flexclustControl")

## some additional slots
as(mycont, "cclustControl")

## default values for ng.rate
new("cclustControl")@ng.rate



