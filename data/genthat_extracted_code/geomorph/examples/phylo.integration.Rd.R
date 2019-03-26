library(geomorph)


### Name: phylo.integration
### Title: Quantify phylogenetic morphological integration between two or
###   more sets of variables under Brownian motion
### Aliases: phylo.integration
### Keywords: analysis

### ** Examples


data(plethspecies) 
Y.gpa<-gpagen(plethspecies$land)    #GPA-alignment
land.gps<-c("A","A","A","A","A","B","B","B","B","B","B") 

IT<- phylo.integration(Y.gpa$coords,partition.gp=land.gps,phy=plethspecies$phy,iter=999)
summary(IT) # Test summary
plot(IT) # PLS plot




