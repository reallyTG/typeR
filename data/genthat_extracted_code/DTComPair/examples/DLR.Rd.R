library(DTComPair)


### Name: DLR
### Title: Estimating the Capacity for Improvement in Diagnostic Risk
###   Prediction with an additional marker based on the Diagnostic
###   Likelihood Ratio (DLR)
### Aliases: DLR

### ** Examples

library(DTComPair)
data(Paired1)

# test y1 conditioned on null model: DLR+(Y1=1) and DLR-(Y1=0)

DLR("~ 1","~ y1","d",Paired1)

# test y1 conditioned on test y2 with interaction, DLR+(Y1=1|Y2=1) and DLR-(Y1=0|Y2=1)

DLR("~ y2","~ y2 * y1","d",Paired1) 



