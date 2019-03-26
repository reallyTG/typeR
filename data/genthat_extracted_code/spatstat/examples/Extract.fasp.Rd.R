library(spatstat)


### Name: Extract.fasp
### Title: Extract Subset of Function Array
### Aliases: [.fasp
### Keywords: spatial manip

### ** Examples

 # Lansing woods data - multitype points with 6 types
 woods <- lansing
 ## Don't show: 
 # smaller dataset
   woods <- woods[ seq(1,npoints(woods),by=45)]
 
## End(Don't show)
 # compute 6 x 6 array of all cross-type K functions
 a <- alltypes(woods, "K")

 # extract first three marks only
 b <- a[1:3,1:3]
 ## Not run: plot(b)
 # subset of array pertaining to hickories
 h <- a[levels(marks(woods)) == "hickory", ]
 ## Not run: plot(h)



