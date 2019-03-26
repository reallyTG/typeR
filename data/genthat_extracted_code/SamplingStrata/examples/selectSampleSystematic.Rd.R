library(SamplingStrata)


### Name: selectSampleSystematic
### Title: Selection of a stratified sample from the frame with systematic
###   method
### Aliases: selectSampleSystematic
### Keywords: survey

### ** Examples

#
# The following example is realistic, but is time consuming
#
## Not run: 
##D library(SamplingStrata)
##D data(swisserrors)
##D data(swissstrata)
##D # optimisation of sampling strata
##D solution <- optimizeStrata ( 
##D     errors = swisserrors, 
##D     strata = swissstrata)
##D # updating sampling strata with new strata labels
##D newstrata <- updateStrata(swissstrata, solution)
##D # updating sampling frame with new strata labels
##D data(swissframe)
##D framenew <- updateFrame(frame=swissframe,newstrata=newstrata)
##D # adding variable "POPTOT" to framenew
##D data("swissmunicipalities")
##D framenew <- merge(framenew,swissmunicipalities[,c("REG","Nom","POPTOT")],
##D                   by.x=c("REG","ID"),by.y=c("REG","Nom"))
##D # selection of sample with systematic method
##D sample <- selectSampleSystematic(frame=framenew,
##D 								outstrata=solution$aggr_strata,
##D 								sortvariable="POPTOT")
##D head(sample)
## End(Not run)



