library(dlmap)


### Name: BSdat
### Title: Simulated data for a backcross
### Aliases: BSdat
### Keywords: datasets

### ** Examples

data(BSdat)
library(qtl) 

# Summary of chromosomes and markers
nchr(BSdat)
nmar(BSdat)

# linkage map of data
plot.map(BSdat)

# interval mapping
BSgp <- calc.genoprob(BSdat, step=2)
BSim <- scanone(BSgp)

# composite interval mapping
BScim <- cim(BSgp, n.marcov=5, method="hk")
 
# LOD profile from CIM
plot(BScim)

# LOD threshold for 5 cofactors from paper
abline(h=3.56)



