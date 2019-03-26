library(PP3)


### Name: print.PP3
### Title: Print information about a PP3 object.
### Aliases: print.PP3
### Keywords: multivariate

### ** Examples

#
# The flea beetle data
#
data(beetle)
#
# Run projection pursuit with 10 random starts (usually MUCH more than this,
# but this example will be run on installation and testing and hence I
# want to minimize computational load. A more reasonable value is 1000)
#
beetle.PP3 <- PP3many(t(beetle), nrandstarts=10)
#
# Output from summary
#
print(beetle.PP3)
#Class 'PP3' : Three-dimensional Projection Pursuit Object:
#       ~~~  : List with 5 components with names
#              ix3 info pdata.list pseudp.vals origvarnames 
#
#Number of random start(s):  10 
#Maximum projection index is  20.39497  achieved by  1  random start(s).
#(Partial) list of those starts achieving max are:  9
#
#summary(.):
#----------
#Summary statistics of projection index
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  13.84   15.36   17.50   17.30   19.08   20.39 
#Summary statistics of pseudo p-values
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  11.14   11.78   12.77   13.59   15.31   17.63 



