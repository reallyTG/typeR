library(FIAR)


### Name: dcmEstimate
### Title: DCM estimator
### Aliases: dcmEstimate
### Keywords: ~DCM

### ** Examples

# Not run
# Estimate posterior parameters of model DCMex with data DCMex$sim
# ts <-  dcmGenerate(DCMex, SNR=1, ar=.2, names=c('V1','V2','V3'))
# DCMex <- dcmEstimate(DCMex, ts)

#Posterior anatomical connections
 DCMex$A

#Posterior functional connections
 DCMex$B

#Posterior input connections
 DCMex$C




