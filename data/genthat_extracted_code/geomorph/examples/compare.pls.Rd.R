library(geomorph)


### Name: compare.pls
### Title: Comparisons of Effect Sizes from Partial Least Squares
### Aliases: compare.pls
### Keywords: analysis

### ** Examples

# Example of comparative morphological integration between pupfish head and body shapes

 data(pupfish) # GPA previously performed
  
 group <- factor(paste(pupfish$Pop, pupfish$Sex, sep = "."))
 levels(group)
  
 tail.LM <- c(1:3, 5:9, 18:38)
 head.LM <- (1:56)[-tail.LM]

 tail.coords <- pupfish$coords[tail.LM,,]
 head.coords <- pupfish$coords[head.LM,,]
 
 # Subset 3D array by group, returning a list of 3D arrays
 tail.coords.gp <- coords.subset(tail.coords, group)
 head.coords.gp <- coords.subset(head.coords, group)

 integ.tests <- Map(function(x,y) integration.test(x, y, iter=499), head.coords.gp, tail.coords.gp)
# the map function performs the integration test on each 3D array in the lists provided

 integ.tests$Marsh.F
 integ.tests$Marsh.M
 integ.tests$Sinkhole.F
 integ.tests$Sinkhole.M

 group.Z <- compare.pls(integ.tests)
 summary(group.Z)

 # Sexual dimorphism in morphological integration in one population
 # but not the other

 # can also list different PLS analyses, separately

 compare.pls(MF = integ.tests$Marsh.F, MM = integ.tests$Marsh.M)




