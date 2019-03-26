library(caribou)


### Name: LRH01
### Title: Leaf River Herd 2001 Data
### Aliases: LRH01
### Keywords: datasets

### ** Examples

data(LRH01)
petersen(LRH01, M=120)
abundance(LRH01, n=120, model="H")
abundance(LRH01, n=120, model="I")
abundance(LRH01, n=120, model="T", B=2)
# The threshold model with B >= 3 is equivalent
# to the homogeneity model for this data set
# because max(LRH01$xi)=2



