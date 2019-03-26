library(BCellMA)


### Name: germlineReconstr
### Title: Function to reconstruction of germline sequencies based on IMGT
###   outputs.
### Aliases: germlineReconstr

### ** Examples

data(IMGTtab2)
data(IMGTtab7)
germline<-germlineReconstr(IMGTtab2$V_REGION, IMGTtab7$V_REGION)
germline



