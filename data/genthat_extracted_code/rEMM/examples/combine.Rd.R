library(rEMM)


### Name: combine
### Title: Combining EMM Objects
### Aliases: c c,EMM-method
### Keywords: manip

### ** Examples

data("16S")

## create two EMMs for different data
emm1 <- EMM("Kullback", threshold=0.1, data=Mollicutes16S+1)
emm2 <- EMM("Kullback", threshold=0.1, data=Alphaproteobacteria16S+1)

## combine the two EMMs
emm12 <- c(emm1, emm2)
## this is the same as:
## emm12 <- copy(emm1)
## c(emm12, emm2, copy=FALSE)

## recluster states so similar states in the to EMMs will be merged
emm12r <- recluster_tNN(emm12)

op <- par(mfrow = c(1, 2), pty = "s")
plot(emm12, method="graph", main="Two EMMs")
plot(emm12r, method="graph", main="Two EMMs (reclustered)")
par(op)



