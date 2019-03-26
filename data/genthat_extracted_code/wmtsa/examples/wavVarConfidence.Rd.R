library(wmtsa)


### Name: wavVarConfidence
### Title: Wavelet variance confidence intervals
### Aliases: wavVarConfidence
### Keywords: distribution

### ** Examples

## first calculate the EDOF for the ocean series 
edof <- wavEDOF(ocean)

## calculate the 95% confidence intervals for EDOF 
## mode 1 
wavVarConfidence(edof$variance.unbiased, edof$EDOF1)



