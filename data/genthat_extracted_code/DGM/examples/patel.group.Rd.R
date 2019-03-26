library(DGM)


### Name: patel.group
### Title: A group is a list containing restructured data from subejcts for
###   easier group analysis.
### Aliases: patel.group

### ** Examples

# create some sample data with 200 samples,
# 3 nodes, and 2 subjects
ts = array(rnorm(200*3*2), dim=c(200,3,2))
mysubs=list()
mysubs[[1]]=patel(ts[,,1])
mysubs[[2]]=patel(ts[,,2])
g=patel.group(mysubs)



