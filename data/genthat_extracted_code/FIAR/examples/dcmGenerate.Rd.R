library(FIAR)


### Name: dcmGenerate
### Title: DCM timeseries generator
### Aliases: dcmGenerate
### Keywords: ~DCM

### ** Examples

# Use example DCMex to generate three timeseries V1, V2, V3 with a SNR of 1 and AR(.2)

 ts <-  dcmGenerate(DCMex, SNR=1, ar=.2, names=c('V1','V2','V3'))
 plot(ts[,1], t='b')




