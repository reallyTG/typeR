library(RandomFields)


### Name: Major Revisions
### Title: Documentation of major changings
### Aliases: MajorRevisions

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## S4 vs S3
x <- seq(0, 10, 0.1)
model <- RMexp()
plot(RFsimulate(model, x)) ## S4
plot(RFsimulate(model, x, spConform=FALSE)) ## no class

## Don't show: 
FinalizeExample()
## End(Don't show)


