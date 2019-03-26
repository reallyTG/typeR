library(dae)


### Name: decomp.relate
### Title: Examines the relationship between the eigenvectors for two
###   decompositions
### Aliases: decomp.relate
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

##obtain sets of projectors
unit.struct <- pstructure(~ Block/Unit, data = PBIBD2.lay)
trt.struct <- pstructure(~ trt, data = PBIBD2.lay)

## obtain intra- and inter-block decompositions
decomp.inter <- proj2.eigen(unit.struct$Q[["Block"]], trt.struct$Q[["trt"]])
decomp.intra <- proj2.eigen(unit.struct$Q[["Unit[Block]"]], trt.struct$Q[["trt"]])

## check that intra- and inter-block decompositions are orthogonal
decomp.relate(decomp.intra, decomp.inter) 



