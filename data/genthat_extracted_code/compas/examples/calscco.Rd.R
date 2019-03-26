library(compas)


### Name: calscco
### Title: Calculate Cartesian coordinates of side chains
### Aliases: calscco

### ** Examples

## Position 10 of nat879 is ASP with 2 side chain dihedrals chi1 and chi2
nat879$atom[nat879$atom$resno==10,]
pdbn <- calscco(nat879,10,c(60.0,-80.0))
pdbn$atom[pdbn$atom$resno==10,]




