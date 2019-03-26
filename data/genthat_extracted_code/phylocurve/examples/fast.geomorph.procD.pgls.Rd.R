library(phylocurve)


### Name: fast.geomorph.procD.pgls
### Title: Fast covariance-based implementations of distance-based methods
### Aliases: fast.geomorph.procD.pgls

### ** Examples

### NOTE: this example is identical 
### to the example code for the
### analogous geomorph function
### for direct comparisons with
### 'fast.geomorph' phylocurve functions
require(geomorph)

### Example of D-PGLS for high-dimensional data
data(plethspecies)
Y.gpa<-gpagen(plethspecies$land)    #GPA-alignment
gdf <- geomorph.data.frame(Y.gpa, phy = plethspecies$phy)
procD.pgls(coords ~ Csize,data = gdf,plethspecies$phy,iter=1000)
fast.geomorph.procD.pgls(Y.gpa$coords ~ Y.gpa$Csize,plethspecies$phy)



