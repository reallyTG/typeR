library(dae)


### Name: marginality
### Title: Extracts the marginality matrix (matrices) from a
###   'pstructure.object' or a 'pcanon.object'.
### Aliases: marginality.pcanon marginality.pstructure marginality
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

##obtain pstructure.object and extract marginality matrix
unit.struct <- pstructure(~ Block/Unit, data = PBIBD2.lay)
unit.marg <- marginality(unit.struct)

##obtain combined decomposition and extract marginality matrices
unit.trt.canon <- designAnatomy(list(unit=~ Block/Unit, trt=~ trt), data = PBIBD2.lay)
marg <- marginality(unit.trt.canon)



