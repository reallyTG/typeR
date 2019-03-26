library(OpenRepGrid)


### Name: distanceSlater
### Title: 'Slater distances' (standardized Euclidean distances).
### Aliases: distanceSlater

### ** Examples


   distanceSlater(bell2010)
   distanceSlater(bell2010, trim=40)

   d <- distanceSlater(bell2010)
   print(d)
   print(d, digits=4)
   
   # using Norris and Makhlouf-Norris (problematic) cutoffs
   print(d, cutoffs=c(.8, 1.2))




