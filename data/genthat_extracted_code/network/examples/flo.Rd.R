library(network)


### Name: flo
### Title: Florentine Wedding Data (Padgett)
### Aliases: flo
### Keywords: datasets

### ** Examples

data(flo)
nflo<-network(flo,directed=FALSE)    #Convert to network object form
all(nflo[,]==flo)                    #Trust, but verify
                                     #A fancy display:
plot(nflo,displaylabels=TRUE,boxed.labels=FALSE,label.cex=0.75)



