library(FIAR)


### Name: dcmEvidence
### Title: modelfit
### Aliases: dcmEvidence
### Keywords: ~DCM

### ** Examples

# Compute how well the model DCMex fits the timeseries DCMex$sim
 ts <-  dcmGenerate(DCMex, SNR=1, ar=.2, names=c('V1','V2','V3'))
 DCMex <- dcmEvidence(DCMex, ts)

 DCMex$AIC
 DCMex$BIC





