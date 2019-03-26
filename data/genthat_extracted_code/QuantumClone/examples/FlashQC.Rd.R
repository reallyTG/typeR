library(QuantumClone)


### Name: FlashQC
### Title: Flash QuantumClone
### Aliases: FlashQC

### ** Examples

set.seed(123)
#1: Cluster data
In<-QuantumClone::Input_Example
FQC<-FlashQC(In,conta = c(0,0),Nclus = 2:10)

#2: Get order variants by clones:
ord<-order(In[[1]]$Chr)
#3: Visualize clustering:
image(
 1:nrow(In[[1]]),
 1:nrow(In[[1]]),
 FQC$similarity[ord,ord], 
 xlab="", ylab="")
#4: add limit of real clusters:
abline(h = cumsum(table(In[[1]]$Chr[ord]))+1)
abline(v = cumsum(table(In[[1]]$Chr[ord]))+1)

#5: alternatively add clusters found:
ord<-order(FQC$cluster)
image(
 1:nrow(In[[1]]),
 1:nrow(In[[1]]),
 FQC$similarity[ord,ord], 
 xlab="", ylab="")
abline(h = cumsum(table(FQC$cluster[ord]))+1)
abline(v = cumsum(table(FQC$cluster[ord]))+1)
# Show clustering quality:
NMI_cutree( FQC$cluster,chr = In[[1]]$Chr)



