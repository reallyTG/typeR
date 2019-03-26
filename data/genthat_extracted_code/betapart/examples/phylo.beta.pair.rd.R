library(betapart)


### Name: phylo.beta.pair
### Title: Pair-wise phylogenetic dissimilarities
### Aliases: phylo.beta.pair

### ** Examples


# toy tree for 6 species (sp1 to sp6)
require(ape)
toy.tree<-read.tree(text="(((sp1:1,sp2:1):5,(sp3:3,sp4:3):3):2,(sp5:7,sp6:7):1);")
plot(toy.tree)

# toy community table with 6 assemblages (A to F) with 6 species (sp1 to sp6)
toy.comm<-matrix(nrow=6, ncol=6)
rownames(toy.comm)<-c("A","B","C","D","E","F")
colnames(toy.comm)<-c("sp1","sp2","sp3","sp4","sp5","sp6")
toy.comm[1,]<-c(1,1,1,0,0,0)
toy.comm[2,]<-c(0,1,1,1,0,0)
toy.comm[3,]<-c(0,0,1,1,1,0)
toy.comm[4,]<-c(0,0,1,1,1,1)
toy.comm[5,]<-c(0,0,0,1,1,1)
toy.comm[6,]<-c(1,0,0,1,1,1)


toy.phylobetapair<-phylo.beta.pair(toy.comm, toy.tree, index.family="sor")
toy.betapair<-beta.pair(toy.comm, index.family="sor")
plot(toy.betapair$beta.sim,toy.phylobetapair$phylo.beta.sim)
plot(toy.betapair$beta.sne,toy.phylobetapair$phylo.beta.sne)



