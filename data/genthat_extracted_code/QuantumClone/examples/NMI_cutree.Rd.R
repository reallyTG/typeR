library(QuantumClone)


### Name: NMI_cutree
### Title: NMI
### Aliases: NMI_cutree

### ** Examples

set.seed(123)
#1: Cluster data
FQC<-FlashQC(QuantumClone::Input_Example,conta = c(0,0),Nclus = 2:10)

#2: Compute NMI
NMI_cutree(FQC$cluster,chr = QuantumClone::Input_Example[[1]]$Chr)



