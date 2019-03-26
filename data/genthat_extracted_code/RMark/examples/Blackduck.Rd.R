library(RMark)


### Name: Blackduck
### Title: Black duck known fate data
### Aliases: Blackduck
### Keywords: datasets

### ** Examples


data(Blackduck)
# Change BirdAge to numeric; starting with version 1.6.3 factor variables are
# no longer allowed.  They can work as in this example but they can be misleading
# and fail if the levels are non-numeric.  The real parameters will remain 
# unchanged but the betas will be different.
Blackduck$BirdAge=as.numeric(Blackduck$BirdAge)-1
run.Blackduck=function()
{
#
# Process data
#
bduck.processed=process.data(Blackduck,model="Known")
#
# Create default design data
#
bduck.ddl=make.design.data(bduck.processed)
#
#  Add occasion specific data min < 0; I have no idea what it is
#
bduck.ddl$S$min=c(4,6,7,7,7,6,5,5)
#
#  Define range of models for S
#
S.dot=list(formula=~1)
S.time=list(formula=~time)
S.min=list(formula=~min)
S.BirdAge=list(formula=~BirdAge)
#
# Note that in the following model in the MARK example, the covariates
# have been standardized.  That means that the beta parameters will be different
# for BirdAge, Weight and their interaction but the likelihood and real parameter
# estimates are the same.
#
S.BirdAgexWeight.min=list(formula=~min+BirdAge*Weight)
S.BirdAge.Weight=list(formula=~BirdAge+Weight)
#
# Create model list and run assortment of models
#
model.list=create.model.list("Known")
bduck.results=mark.wrapper(model.list,data=bduck.processed,ddl=bduck.ddl,
               invisible=FALSE,threads=1)

#
# Return model table and list of models
#
return(bduck.results)
}
bduck.results=run.Blackduck()
bduck.results






