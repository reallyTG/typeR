library(TripleR)


### Name: matrix2long
### Title: Convert a quadratic matrix to long format
### Aliases: matrix2long

### ** Examples

#The example data are taken from the "Mainz Freshman Study" and consist 
# of ratings of liking as well as ratings of the metaperception of 
# liking at zero-acquaintance using a Round-Robin group of 54 participants 
# (Back, Schmukle, & Egloff, in pres)

# load a data set in matrix style
data("liking_a")

str(liking_a)
long <- matrix2long(liking_a)

str(long)
 



