library(social)


### Name: social.all.paths
### Title: All paths between two nodes
### Aliases: social.all.paths

### ** Examples

# Using the data from Figure 1 in Roberts & Kroese (2007)
A = matrix(c(0,1,0,1,0,
             1,0,0,1,1,
             0,0,0,1,1,
             1,1,1,0,0,
             0,1,1,0,0), nrow=5)
paths = social.all.paths(A, 1, 5)




