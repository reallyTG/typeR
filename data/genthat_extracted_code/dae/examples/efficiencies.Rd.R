library(dae)


### Name: efficiencies
### Title: Extracts the canonical efficiency factors from a 'pcanon.object'
###   or a 'p2canon.object'.
### Aliases: efficiencies efficiencies.pcanon efficiencies.p2canon
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

##obtain combined decomposition using designAnatomy and get the efficiencies
unit.trt.canon <- designAnatomy(list(unit=~ Block/Unit, trt=~ trt), data = PBIBD2.lay)
efficiencies.pcanon(unit.trt.canon)

##obtain the projectors for each formula using pstructure
unit.struct <- pstructure(~ Block/Unit, data = PBIBD2.lay)
trt.struct <- pstructure(~ trt, data = PBIBD2.lay)

##obtain combined decomposition projs.2canon and get the efficiencies
unit.trt.p2canon <- projs.2canon(unit.struct$Q, trt.struct$Q)
efficiencies.p2canon(unit.trt.p2canon)



