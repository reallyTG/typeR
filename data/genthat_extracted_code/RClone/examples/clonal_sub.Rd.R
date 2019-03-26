library(RClone)


### Name: clonal_sub
### Title: Clonal Subrange
### Aliases: clonal_sub clonal_sub_core id_clonal_mod id_clonal_mod_MLL
### Keywords: documentation

### ** Examples

data(posidonia)
data(coord_posidonia)

distGC <- c(0,10,15,20,30,50,70,76.0411073)

clonal_sub(posidonia, coords = coord_posidonia)
clonal_sub(posidonia, coords = coord_posidonia, vecdist = distGC)



