library(phylocurve)


### Name: fast.geomorph.physignal
### Title: Fast covariance-based implementations of distance-based methods
### Aliases: fast.geomorph.physignal

### ** Examples

### NOTE: this example is identical 
### to the example code for the
### analogous geomorph function
### for direct comparisons with
### 'fast.geomorph' phylocurve functions
require(geomorph)
data(plethspecies)
Y.gpa<-gpagen(plethspecies$land)    #GPA-alignment

#Test for phylogenetic signal in shape
physignal(phy=plethspecies$phy,Y.gpa$coords,iter=99)
fast.geomorph.physignal(plethspecies$phy,Y.gpa$coords,method="Kmult")

#Test for phylogenetic signal in size
physignal(phy=plethspecies$phy,Y.gpa$Csize,iter=99)
fast.geomorph.physignal(plethspecies$phy,Y.gpa$Csize,method="Kmult")



