library(phylocurve)


### Name: fast.geomorph.compare.multi.evol.rates
### Title: Fast covariance-based implementations of distance-based methods
### Aliases: fast.geomorph.compare.multi.evol.rates

### ** Examples

### NOTE: this example is identical 
### to the example code for the
### analogous geomorph function
### for direct comparisons with
### 'fast.geomorph' phylocurve functions
require(geomorph)
data(plethspecies)
Y.gpa<-gpagen(plethspecies$land)    #GPA-alignment
land.gp<-c("A","A","A","A","A","B","B","B","B","B","B")  #mandible and cranium subsets

compare.multi.evol.rates(Y.gpa$coords,land.gp,phy=plethspecies$phy,iter=99)
fast.geomorph.compare.multi.evol.rates(Y.gpa$coords,land.gp,plethspecies$phy)



