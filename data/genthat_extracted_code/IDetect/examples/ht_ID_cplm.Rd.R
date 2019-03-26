library(IDetect)


### Name: ht_ID_cplm
### Title: Apply the Isolate-Detect methodology for multiple change-point
###   detection in a continuous, piecewise-linear vector with non Gaussian
###   noise
### Aliases: ht_ID_cplm

### ** Examples

single.cpt <- c(seq(0, 1999, 1), seq(1998, -1, -1))
single.cpt.student <- single.cpt + rt(4000, df = 5)
cpt.single <- ht_ID_cplm(single.cpt.student)

three.cpt <- c(seq(0, 3998, 2), seq(3996, -2, -2), seq(0,3998,2), seq(3996,-2,-2))
three.cpt.student <- three.cpt + rt(8000, df = 5)
cpt.three <- ht_ID_cplm(three.cpt.student)



