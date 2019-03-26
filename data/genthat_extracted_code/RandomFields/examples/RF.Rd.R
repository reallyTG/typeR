library(RandomFields)


### Name: RFfunction
### Title: Evaluation operators (RF commands)
### Aliases: RF RFmodel RFmodels RFfunction RFfunctions
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

z <- RFsimulate(model=RMexp(), 1:10)
RFgetModel(RFsimulate, show.call = TRUE)  # user's definition
RFgetModel(RFsimulate, show.call = FALSE) # main internal part

## Don't show: 
FinalizeExample()
## End(Don't show)


