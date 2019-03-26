library(cancerTiming)


### Name: alleleFrequency
### Title: Get allele frequencies for tumor data
### Aliases: allAF contAF decontAF errorAF

### ** Examples

contAF(1/3,totalCopy=3,normCont=.1,type="mutation")
contAF(c(.5,.5,.5),totalCopy=c(2,4,6),normCont=.2)

#allele frequencies possible for a location that is same 
#as reference in the normal, for three different values of normal contamination
allAF(totalCopy=3,normCont=c(0,.1,.5),type="mutation") 
#same, but for those that are heterozygous in the normal
allAF(totalCopy=3,normCont=c(0,.1,.5),type="SNPHet") 



