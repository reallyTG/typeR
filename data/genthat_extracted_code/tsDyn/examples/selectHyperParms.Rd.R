library(tsDyn)


### Name: selectHyperParms
### Title: Automatic selection of model hyper-parameters
### Aliases: selectLSTAR selectNNET
### Keywords: ts

### ** Examples

llynx <- log10(lynx)
selectLSTAR(llynx, m=2)
selectNNET(llynx, m=3, size=1:5)



