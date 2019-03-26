library(numOSL)


### Name: scaleSGCN
### Title: Natural-dose signal re-scaling
### Aliases: scaleSGCN scaleSGCN.default
### Keywords: LS-normalisation equivalent dose

### ** Examples

 # Not run.
 data(SARdata)
 gSGCpars <- c(137.440874251, 0.007997863, 2.462035263, -0.321536177)
 scaleSGCN(as_analyseBIN(SARdata), SGCpars=gSGCpars, model="gok", 
           origin=FALSE, SAR.Cycle=c("N","R3"))



