library(beadarrayMSV)


### Name: testHardyWeinberg
### Title: Test for Hardy-Weinberg equilibrium
### Aliases: testHardyWeinberg

### ** Examples

#Arbitrary MSV-5 marker
sizes <- c(30, 200, 1600, 700, 400)
polyCent <- generatePolyCenters(ploidy='tetra')
HWstats <- testHardyWeinberg(sizes,'MSV-5',polyCent=polyCent)
print(HWstats)



