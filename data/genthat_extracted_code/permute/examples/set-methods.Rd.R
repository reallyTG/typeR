library(permute)


### Name: set-methods
### Title: Replacement functions to set components of a permutation design
### Aliases: set-methods setBlocks<- setBlocks<-.default setBlocks<-.how
###   setBlocks<-.permControl setWithin<- setWithin<-.default
###   setWithin<-.how setStrata<- setStrata<-.default setStrata<-.how
###   setStrata<-.Plots setType<- setType<-.default setType<-.how
###   setType<-.Plots setType<-.Within setMirror<- setMirror<-.default
###   setMirror<-.how setMirror<-.Plots setMirror<-.Within setConstant<-
###   setConstant<-.default setConstant<-.how setConstant<-.Plots
###   setConstant<-.Within setPlots<- setPlots<-.default setPlots<-.how
###   setRow<- setRow<-.default setRow<-.how setRow<-.Plots setRow<-.Within
###   setCol<- setCol<-.default setCol<-.how setCol<-.Plots setCol<-.Within
###   setDim<- setDim<-.default setDim<-.how setDim<-.Plots setDim<-.Within
###   setNperm<- setNperm<-.default setNperm<-.how setNperm<-.permControl
###   setAllperms<- setAllperms<-.default setAllperms<-.how
###   setAllperms<-.permControl setMaxperm<- setMaxperm<-.default
###   setMaxperm<-.how setMaxperm<-.permControl setMinperm<-
###   setMinperm<-.default setMinperm<-.how setMinperm<-.permControl
###   setComplete<- setComplete<-.default setComplete<-.how
###   setComplete<-.permControl setMake<- setMake<-.default setMake<-.how
###   setObserved<- setObserved<-.default setObserved<-.how
### Keywords: methods utils

### ** Examples

## extract components from a "how" object
hh <- how()
getNperm(hh)
setNperm(hh) <- 999
getNperm(hh)



