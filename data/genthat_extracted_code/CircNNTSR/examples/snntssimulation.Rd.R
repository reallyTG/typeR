library(CircNNTSR)


### Name: snntssimulation
### Title: SNNTS density simulation function
### Aliases: snntssimulation

### ** Examples

M<-c(2,3)
R<-length(M)
ccoef<-mnntsrandominitial(M,R)
data<-mnntssimulation(10,ccoef,M,R)
data



