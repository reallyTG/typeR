library(BarcodingR)


### Name: barcoding.spe.identify2
### Title: Species Identification Based on Fuzzy-set Method and kmer
### Aliases: barcoding.spe.identify2
### Keywords: barcoding.spe.identify2

### ** Examples


data(pineMothITS2) 
ref<-pineMothITS2
que<-ref
spe.id<-barcoding.spe.identify2(ref,que, kmer = 1, optimization = FALSE)
spe.id
 



