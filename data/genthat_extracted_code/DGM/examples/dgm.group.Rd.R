library(DGM)


### Name: dgm.group
### Title: A group is a list containing restructured data from subejcts for
###   easier group analysis.
### Aliases: dgm.group

### ** Examples

# create some sample data with 200 samples,
# 3 nodes, and 2 subjects
ts = array(rnorm(200*3*2), dim=c(200,3,2))
mysubs=list()
mysubs[[1]]=subject(ts[,,1])
mysubs[[2]]=subject(ts[,,2])
g=dgm.group(mysubs)




