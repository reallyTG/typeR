library(geomorph)


### Name: compare.multi.evol.rates
### Title: Comparing net rates of shape evolution among traits on
###   phylogenies
### Aliases: compare.multi.evol.rates
### Keywords: analysis

### ** Examples


data(plethspecies) 
Y.gpa<-gpagen(plethspecies$land)    #GPA-alignment    
land.gp<-c("A","A","A","A","A","B","B","B","B","B","B")  #mandible and cranium subsets

EMR<-compare.multi.evol.rates(A=Y.gpa$coords,gp=land.gp, 
    Subset=TRUE, phy= plethspecies$phy,iter=999)
summary(EMR)
plot(EMR)



