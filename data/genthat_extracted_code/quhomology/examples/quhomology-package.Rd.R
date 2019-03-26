library(quhomology)


### Name: quhomology-package
### Title: Calculation of Homology groups of a rack/birack
### Aliases: quhomology-package quhomology
### Keywords: package

### ** Examples

#Using the up and down action as provided for the dihedral quandle, we can then calculate:

#$H_3^R(R_3)$ by 
homology(3,3,FALSE)


#$H_3^Q(R_3)$ by 
homology(3,3,TRUE)

#$H_3^D(R_3)$ by 
degenerate_homology(3,3)




