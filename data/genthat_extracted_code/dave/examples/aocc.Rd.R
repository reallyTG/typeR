library(dave)


### Name: aocc
### Title: Analysis of concentration (AOC)
### Aliases: aocc aocc.default plot.aocc aoc
### Keywords: multivariate array

### ** Examples

# First, groups of releves are formed
require(vegan)
dr<- vegdist(nveg^0.5,method="bray")      # dr is distance matrix of rows
o.clr<- hclust(dr,method="ward.D2")          # this is clustering
o.rgr<- cutree(o.clr,k=3)                 # 3 row groups formed
# Now I group the columns of nveg (the species)
# the same way as for rows
ds<- vegdist(t(nveg^0.25),method="euclid")
o.cls<- hclust(ds,method="ward.D2")
o.sgr<- cutree(o.cls,k=4)                  # 4 column groups formed

o.aocc<- aocc(nveg,o.rgr,o.sgr)
plot(o.aocc)                               # double scatter plot
                                           # 3 row-, 4 column goups as points.

# If cluster analysis is not used but classification is input by row and 
# column to be processed by aocc():
o.rgr<- c(1,2,1,3,2,3,1,2,3,1,3)
o.sgr<- c(1,1,2,2,1,3,4,3,1,1,1,3,3,1,1,4,4,4,4,1,3)
o.aocc<- aocc(nveg,o.rgr,o.sgr)
plot(o.aocc)




