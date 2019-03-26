library(geomorph)


### Name: compare.evol.rates
### Title: Comparing net rates of shape evolution on phylogenies
### Aliases: compare.evol.rates
### Keywords: analysis

### ** Examples

data(plethspecies) 
Y.gpa<-gpagen(plethspecies$land)    #GPA-alignment    
 gp.end<-factor(c(0,0,1,0,0,1,1,0,0))  #endangered species vs. rest
 names(gp.end)<-plethspecies$phy$tip

ER<-compare.evol.rates(A=Y.gpa$coords, phy=plethspecies$phy,method="simulation",gp=gp.end,iter=999)
summary(ER)
plot(ER)



