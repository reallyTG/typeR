library(protViz)


### Name: iTRAQ2GroupAnalysis
### Title: iTRAQ two group analysis
### Aliases: iTRAQ2GroupAnalysis

### ** Examples

       data(iTRAQ)
       par(mfrow=c(2,3))
       qProt<-iTRAQ2GroupAnalysis(data=iTRAQ, 
        group1=c(3,4,5,6), 
        group2=7:10, INDEX=iTRAQ$prot, plot=TRUE)
       qProt
       qPeptide<-iTRAQ2GroupAnalysis(data=iTRAQ, 
        group1=c(3,4,5,6), 
        group2=7:10, 
        INDEX=paste(iTRAQ$prot,iTRAQ$peptide), plot=FALSE)



