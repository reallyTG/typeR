library(phylocurve)


### Name: fast.geomorph.compare.evol.rates
### Title: Fast covariance-based implementations of distance-based methods
### Aliases: fast.geomorph.compare.evol.rates

### ** Examples

### NOTE: this example is identical 
### to the example code for the
### analogous geomorph function
### for direct comparisons with
### 'fast.geomorph' phylocurve functions

require(geomorph)
data(plethspecies)
Y.gpa<-gpagen(plethspecies$land)    #GPA-alignment

 gp.end<-factor(c(0,0,1,0,0,1,1,0,0))  #endangered species vs. rest
 names(gp.end)<-plethspecies$phy$tip

#Calculate rates of shape
compare.evol.rates(phy=plethspecies$phy,Y.gpa$coords,gp=gp.end,iter=49)
fast.geomorph.compare.evol.rates(plethspecies$phy,Y.gpa$coords,gp=gp.end)

#Calculate rates of size
compare.evol.rates(phy=plethspecies$phy,Y.gpa$Csize,gp=gp.end,iter=49)
fast.geomorph.compare.evol.rates(plethspecies$phy,Y.gpa$Csize,gp=gp.end,iter=49)



