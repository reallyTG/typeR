library(paleotree)


### Name: modelMethods
### Title: Model Function Methods: Parameter Names, Bounds and Initial
###   Values
### Aliases: modelMethods parnames parbounds parbounds.constrained
###   parbounds.paleotreeFunc parInit parInit.constrained
###   parInit.paleotreeFunc parLower parLower.constrained
###   parLower.paleotreeFunc parnames.constrained parnames.paleotreeFunc
###   parUpper parUpper.constrained parUpper.paleotreeFunc
###   parnames.paleotreeFunc parnames.constrained parnames<-
###   parnames<-.constrained parnames<-.paleotreeFunc parbounds
###   parbounds.paleotreeFunc parbounds.constrained parbounds<-
###   parbounds<-.constrained parbounds<-.paleotreeFunc parLower
###   parLower.constrained parLower.paleotreeFunc parLower<-
###   parLower<-.constrained parLower<-.paleotreeFunc parUpper
###   parUpper.constrained parUpper.paleotreeFunc parUpper<-
###   parUpper<-.constrained parUpper<-.paleotreeFunc parInit
###   parInit.constrained parInit.paleotreeFunc

### ** Examples

#example with make_durationFreqCont
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
rangesCont <- sampleRanges(taxa,r = 0.5)
likFun <- make_durationFreqCont(rangesCont)

#get parameter names
parnames(likFun)

#get the bounds for those parameters
parbounds(likFun)

#can also get these seperately
parLower(likFun)
parUpper(likFun)

#initial parameter values
parInit(likFun)   #arbitrary midway value between par bounds

#can then use these in optimizers, such as optim with L-BFGS-B
#see the example for make_durationFreqCont

#renaming parameter names
likFun2 <- likFun
parnames(likFun2) <- c("extRate","sampRate")
parnames(likFun2)
#test if reset correctly
parnames(likFun2) == c("extRate","sampRate")
#also works for constrained functions
constrainFun <- constrainParPaleo(likFun,q.1~r.1)
parnames(constrainFun)
#also modified the parameter bounds, see!
parbounds(constrainFun)
parInit(constrainFun)
#but cannot rename parameter for constrained function!




