library(dae)


### Name: designAnatomy
### Title: An anatomy of a design showing the confounding and aliasing
###   inherent in the design that is obtained via a canonical analysis of
###   its projectors.
### Aliases: designAnatomy
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

##obtain combined decomposition and summarize
unit.trt.canon <- designAnatomy(formulae = list(unit=~ Block/Unit, trt=~ trt),
                                data = PBIBD2.lay)
summary(unit.trt.canon, which.criteria = c("aeff","eeff","order"))
summary(unit.trt.canon, which.criteria = c("aeff","eeff","order"), labels.swap = TRUE)

## Three-phase sensory example from Brien and Payne (1999)
## Not run: 
##D data(Sensory3Phase.dat)
##D Eval.Field.Treat.canon <- designAnatomy(formulae = list(
##D                               eval= ~ ((Occasions/Intervals/Sittings)*Judges)/Positions, 
##D                               field= ~ (Rows*(Squares/Columns))/Halfplots,
##D                               treats= ~ Trellis*Method),
##D                                         data = Sensory3Phase.dat)
##D summary(Eval.Field.Treat.canon, which.criteria =c("aefficiency", "order"))
## End(Not run)



