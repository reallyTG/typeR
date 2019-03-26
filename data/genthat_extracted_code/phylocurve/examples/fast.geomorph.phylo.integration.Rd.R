library(phylocurve)


### Name: fast.geomorph.phylo.integration
### Title: Fast covariance-based implementations of distance-based methods
### Aliases: fast.geomorph.phylo.integration

### ** Examples

### NOTE: this example is identical 
### to the example code for the
### analogous geomorph function
### for direct comparisons with
### 'fast.geomorph' phylocurve functions
require(geomorph)
data(plethspecies)
Y.gpa<-gpagen(plethspecies$land)    #GPA-alignment

# NOTE: phylo.integration is phylo.integration in newer versions of geomorph
# phylo.integration(Y.gpa$coords[1:5,,],Y.gpa$coords[6:11,,],plethspecies$phy,iter=99)
# phylo.integration(Y.gpa$coords[1:5,,],Y.gpa$coords[6:11,,],plethspecies$phy,iter=99)
fast.geomorph.phylo.integration(Y.gpa$coords[1:5,,],Y.gpa$coords[6:11,,],plethspecies$phy)



