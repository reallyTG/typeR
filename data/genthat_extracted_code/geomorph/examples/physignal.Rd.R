library(geomorph)


### Name: physignal
### Title: Assessing phylogenetic signal in Procrustes shape variables
### Aliases: physignal
### Keywords: analysis

### ** Examples

data(plethspecies) 
Y.gpa<-gpagen(plethspecies$land)    #GPA-alignment    

#Test for phylogenetic signal in shape
PS.shape <- physignal(A=Y.gpa$coords,phy=plethspecies$phy,iter=999)
summary(PS.shape)
plot(PS.shape)

#Test for phylogenetic signal in size
PS.size <- physignal(A=Y.gpa$Csize,phy=plethspecies$phy,iter=999)
summary(PS.size)
plot(PS.size)



