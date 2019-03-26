library(GpGp)


### Name: group_obs
### Title: Automatic grouping (partitioning) of locations
### Aliases: group_obs

### ** Examples

locs <- matrix( runif(200), 100, 2 )   # generate random locations
ord <- order_maxmin(locs)              # calculate an ordering
locsord <- locs[ord,]                  # reorder locations
m <- 10
NNarray <- find_ordered_nn(locsord,m)  # m nearest neighbor indices
NNlist2 <- group_obs(NNarray)          # join blocks if joining reduces squares
NNlist3 <- group_obs(NNarray,3)        # join blocks if joining reduces cubes
object.size(NNarray)
object.size(NNlist2)
object.size(NNlist3)
mean( NNlist2[["local_resp_inds"]] - 1 )   # average number of neighbors (exponent 2)
mean( NNlist3[["local_resp_inds"]] - 1 )   # average number of neighbors (exponent 3)

all_inds <- NNlist2$all_inds
last_ind_of_block <- NNlist2$last_ind_of_block
inds_of_block_2 <- all_inds[ (last_ind_of_block[1] + 1):last_ind_of_block[2] ]

local_resp_inds <- NNlist2$local_resp_inds
global_resp_inds <- NNlist2$global_resp_inds
last_resp_of_block <- NNlist2$last_resp_of_block
local_resp_of_block_2 <- local_resp_inds[(last_resp_of_block[1]+1):last_resp_of_block[2]]

global_resp_of_block_2 <- global_resp_inds[(last_resp_of_block[1]+1):last_resp_of_block[2]]
inds_of_block_2[local_resp_of_block_2]
# these last two should be the same




