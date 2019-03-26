library(RandomFields)


### Name: RFgetModelNames
### Title: Names of implemented covariance and variogram models
### Aliases: RFgetModelNames
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

# get list of names of all functions
RFgetModelNames()

# any kind of positive definite functions
RFgetModelNames(type="positive definite", exact.match=TRUE)
## Not run: RFgetModelNames(type="positive definite")

# get a list of names of all stationary models
RFgetModelNames(type="positive definite", domain="single variable",
                 exact.match=TRUE)
## Not run: RFgetModelNames(type="positive definite", domain="single variable")

# get a vector of all model names
RFgetModelNames(group.by=NULL)


## Don't show: ## Not run: 
##D 
##D 
##D # get list of all univariate stationary models
##D # additionally grouped by the isotropy attribute
##D str(RFgetModelNames(type="positive definite", domain="single variable",
##D                     vdim=1, group.by="isotropy"))
##D 
##D # get vector of all models which are operators
##D # and valid in the two-dimensional coordinate space
##D RFgetModelNames(type=c("tail correlation function",
##D                        "positive definite",
##D                        "variogram",
##D                        "undefined"),
##D                 operator=TRUE, valid.in.dim=2)
##D 
##D # processes and covariance function grouped by the stationarity
##D # argument and subsequently grouped by the isotropy argument
##D 
##D str(RFgetModelNames(type=c("positive definite", "variogram", "process"),
##D                     group.by=c("type", "domain", "isotropy")))
## End(Not run)## End(Don't show)

## Don't show: 
FinalizeExample()
## End(Don't show)


