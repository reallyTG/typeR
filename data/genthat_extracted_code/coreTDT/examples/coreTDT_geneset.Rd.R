library(coreTDT)


### Name: coreTDT
### Title: Transimission Disequilibrium Test for compound heterozygous and
###   recessive models
### Aliases: coreTDT_geneset coreTDT_single
### Keywords: coreTDT

### ** Examples

data(coreTDTexample)
attach(coreTDTexample)	
coreTDT_geneset(samplePed, controlInf,maf.threshold=0.05,writeFile=FALSE)



