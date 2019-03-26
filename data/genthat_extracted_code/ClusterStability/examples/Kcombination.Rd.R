library(ClusterStability)


### Name: Kcombination
### Title: Kcombination returns the list of all possible combinations of a
###   set of numbers of a given length _k_.
### Aliases: Kcombination
### Keywords: k-combination

### ** Examples

   ## Returns the k-combination of the list of numbers: 1,2,3 of length=2.
   ## i.e. (1,2), (1,3), (2,3) 
	Kcombination(c(1,2,3),k=2)
   ## Returns only the k-combination containing the number 1.
   ## i.e. (1,2), (1,3)	
	Kcombination(c(1,2,3),k=2,selector=1)



