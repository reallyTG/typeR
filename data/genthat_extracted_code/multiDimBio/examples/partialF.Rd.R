library(multiDimBio)


### Name: partialF
### Title: A function to compute partial F statistics
### Aliases: partialF

### ** Examples

#Internal function used in FSelect

data(Nuclei)
data(Groups)

NPC<-floor(ncol(Nuclei)/5)

DAT.comp<-completeData(Nuclei, n_pcs = NPC) 
Groups.use<-c(1,2) 
use.DAT<-which(Groups==Groups.use[1]|Groups==Groups.use[2])

DAT.use<-Nuclei[use.DAT,]
GR.use<-Groups[use.DAT]

traitA<-2

mlda<-MASS::lda(GR.use~DAT.use[,traitA])

F1<-partialF(mlda,GR.use,0)

traitB<-1

mlda2<-MASS::lda(GR.use~DAT.use[,c(traitA,traitB)])

partialF(mlda2,GR.use,F1)




