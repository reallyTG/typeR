library(pedantics)


### Name: phensim
### Title: A function to simulated phenotypic data
### Aliases: phensim
### Keywords: datagen

### ** Examples

## make up a pedigree
id<-   c("a1","a2","a3","a4","a5","a6","a7","a8","a9")
dam<-  c(NA,NA,NA,"a1","a1","a1","a4","a4","a4")
sire<- c(NA,NA,NA,"a2","a2","a2","a5","a6","a6")
pedigree<-as.data.frame(cbind(id,sire,dam))

traits<-2
## no correlations
randomA<-diag(4)
randomE<-diag(4)
parentalA<-c("d","d","m","m")
parentalE<-c("d","d","m","m")

## generate phenoypic data based on this architecture
phensim(pedigree=pedigree,traits=2,randomA=randomA,randomE=randomE,
          parentalA=parentalA,parentalE=parentalE)

## let's do it again but see how the phenotypes were composed
phensim(pedigree=pedigree,traits=2,randomA=randomA,randomE=randomE,
          parentalA=parentalA,parentalE=parentalE,returnAllEffects=TRUE)



