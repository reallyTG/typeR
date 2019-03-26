library(EcoGenetics)


### Name: eco.lagweight
### Title: Obtention of a list of spatial weights for classes defined by
###   inter-individual distances or nearest-neighbors
### Aliases: eco.lagweight

### ** Examples

## Not run: 
##D data(eco.test)
##D 
##D # method sturges-smax: in this case, the program generates 
##D # classes using the Sturge's rule.  
##D # As smax and smin are undefined, the program uses the default
##D # options (smin = 0, and smax = maximum inter-individual distance)
##D classlist <- eco.lagweight(eco[["XY"]]) 
##D classlist
##D 
##D # method sturges-smax: idem, but smax = 16
##D classlist <- eco.lagweight(eco[["XY"]], smax=16) 
##D 
##D ## using smax <16 in this case generates empty classes, 
##D ## which is not allowed
##D 
##D # method sturges-smax: idem, but smin = 3
##D classlist <- eco.lagweight(eco[["XY"]], smin = 3, smax = 15)
##D 
##D # method sturges-smax: complete range, 
##D # and cummulative = TRUE (instead of using
##D # lower and upper limits for each class, only the upper is used in turn)
##D classlist <- eco.lagweight(eco[["XY"]], cummulative = TRUE)
##D 
##D # method n.classes-smax: complete range partitioned in 4 classes
##D classlist <- eco.lagweight(eco[["XY"]], nclass = 4)
##D 
##D # method n.classes-smax: idem, but smax =  15
##D classlist <- eco.lagweight(eco[["XY"]], nclass = 4, smax = 15)
##D 
##D # method int-smax: the complete range partitioned each <int> units
##D # of inter-individual distance
##D classlist <- eco.lagweight(eco[["XY"]], int = 2)
##D 
##D # method int-smax: idem, but smax = 15 and smin = 3
##D classlist <- eco.lagweight(eco[["XY"]], int = 2, smin = 3, smax = 15)
##D 
##D # method equal.size: n individuals in each class, 
##D # partitioning the complete range.
##D classlist <- eco.lagweight(eco[["XY"]], size = 1000)
##D 
##D ## In the latter example, as an inter-individual distance
##D ## appear more than one time (different individuals pairs, 
##D ## identical distances), with a size <700 the limits
##D ## of some classes cannot be defined, and this is not allowed
##D 
##D # method equal.size: n individuals in each class, 
##D # but smax = 15
##D classlist <- eco.lagweight(eco[["XY"]], size = 1000, smax = 15)
##D 
##D # method kmax: sequence from k = 1 to k = n, in this case, n = 3
##D classlist <- eco.lagweight(eco[["XY"]], kmax = 3)
##D 
##D # method kmax: idem, but elements self-included
##D # (i.e., the pairs i-i, for all individuals i, are included)
##D classlist <- eco.lagweight(eco[["XY"]], kmax = 3, self = TRUE)
##D 
##D # method seqvec: a vector with the breaks is used
##D vec <- seq(0, 10, 2)
##D classlist <- eco.lagweight(eco[["XY"]], seqvec = vec)
##D 
##D #-----------------------
##D # ACCESSORS USE EXAMPLE
##D #-----------------------
##D 
##D # the slots are accessed with the generic format 
##D # (ecoslot. + name of the slot + name of the object). 
##D # See help("EcoGenetics accessors")
##D 
##D ecoslot.BREAKS(classlist) # information about breaks. It includes the upper and lower limits
##D 
## End(Not run)




