library(CircNNTSR)


### Name: mnntssimulation
### Title: MNNTS density simulation function
### Aliases: mnntssimulation

### ** Examples

M<-c(2,3)
R<-length(M)
ccoef<-mnntsrandominitial(M,R)
data<-mnntssimulation(10,ccoef,M,R)
data



