library(dave)


### Name: ccost
### Title: Cost function of 2 alternative classifications of rows in
###   vegetation data
### Aliases: ccost ccost.default print.ccost ccost2
### Keywords: misc array

### ** Examples

# First, groups of releves are formed by cluster analysis
require(vegan)
dr<- vegdist(nveg^0.5,method="bray")      # dr is distance matrix of rows
o.clr<- hclust(dr,method="ward")          # this is clustering
oldgr<- cutree(o.clr,k=3)                 # 3 row groups formed
oldgr                                     # this displays initial classification:
# 2  4  6  9 10 18 25 27 39 49 50
# 1  2  1  3  2  3  1  2  3  1  3

# For simplicity we assume that row "2" and "50" change memebership:
newgr<- c(2,2,1,3,2,3,1,2,3,1,1)
o.ccost<- ccost(nveg,oldgr,newgr,y=0.5)           # does square root transformation
# Default method releasing cf
o.ccost                                           # displays C and W (see above)



