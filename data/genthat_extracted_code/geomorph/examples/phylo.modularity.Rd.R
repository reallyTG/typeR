library(geomorph)


### Name: phylo.modularity
### Title: Evaluate the degree of phylogenetic modular signal in Procrustes
###   shape variables
### Aliases: phylo.modularity
### Keywords: analysis

### ** Examples

data(plethspecies)
Y.gpa<-gpagen(plethspecies$land)    #GPA-alignment
land.gps<-c("A","A","A","A","A","B","B","B","B","B","B") 

MT <- phylo.modularity(Y.gpa$coords, partition.gp=land.gps, phy=plethspecies$phy, 
CI = FALSE, iter=499)
summary(MT) # Test summary
plot(MT) # Histogram of CR sampling distribution 



