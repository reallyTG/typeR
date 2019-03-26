library(crank)


### Name: spsort
### Title: Simple partial sorting of a vector of elements.
### Aliases: spsort
### Keywords: misc

### ** Examples

 # Pedro's example
 Smaller<-c("ASD", "DFE", "ASD", "SDR", "EDF", "ASD")
 Larger<-c("SDR", "EDF", "KLM", "KLM", "SDR", "EDF")
 matComp<-cbind(Smaller,Larger)
 spsort(matComp)
 # scramble the order of rules
 nmatrows<-nrow(matComp)
 spsort(matComp[sample(1:nmatrows,nmatrows),])
 # David Urbina's example
 priors<-c("A","B","C","C","D","E","E","F","G")
 posts<-c("E","H","A","D","E","B","F","G","H")
 dinnerMat<-cbind(priors,posts)
 spsort(dinnerMat)
 # add the condition that the taquitos must precede the guacamole
 dinnerMat<-rbind(dinnerMat,c("G","B"))
 spsort(dinnerMat)
 # scramble the rows
 nmatrows<-nrow(dinnerMat)
 spsort(dinnerMat[sample(1:nmatrows,nmatrows),])



