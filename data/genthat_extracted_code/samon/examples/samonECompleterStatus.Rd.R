library(samon)


### Name: samonECompleterStatus
### Title: Computes the difference in the expected value of non-completers
###   and completers
### Aliases: samonECompleterStatus

### ** Examples

data("samonPANSS1")
data( "PSummary1" )
PSummary1 <- (PSummary1$TM)[,c("alpha","IFEst")]
Pdiff1 <- samonECompleterStatus( samonPANSS1[,ncol(samonPANSS1)], PSummary1[,2] )


data("VAS1")
data("VSummary1" )
VSummary1 <- (VSummary1$TM)[,c("alpha","IFEst")]
Vdiff1 <- samonECompleterStatus( VAS1[,ncol(VAS1)], VSummary1[,2] )



