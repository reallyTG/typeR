library(dae)


### Name: projs.combine.p2canon
### Title: Extract, from a p2canon object, the projectors that give the
###   combined canonical decomposition
### Aliases: projs.combine.p2canon
### Keywords: array design projector

### ** Examples

## PBIBD(2) from p. 379 of Cochran and Cox (1957) Experimental Designs. 
## 2nd edn Wiley, New York
PBIBD2.unit <- list(Block = 6, Unit = 4)
PBIBD2.nest <- list(Unit = "Block")
trt <- factor(c(1,4,2,5, 2,5,3,6, 3,6,1,4, 4,1,5,2, 5,2,6,3, 6,3,4,1))
PBIBD2.lay <- designRandomize(allocated = trt, 
                              recipient = PBIBD2.unit, 
                              nested.recipients = PBIBD2.nest)

## obtain sets of projectors
unit.struct <- pstructure(~ Block/Unit, data = PBIBD2.lay)
trt.struct <- pstructure(~ trt, data = PBIBD2.lay)

##obtain combined decomposition
unit.trt.p2canon <- projs.2canon(unit.struct$Q, trt.struct$Q)
UcombineT <- projs.combine.p2canon(unit.trt.p2canon)



