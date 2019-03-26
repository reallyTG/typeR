library(blocksdesign)


### Name: blocks
### Title: Block designs for unstructured treatment sets
### Aliases: blocks

### ** Examples


## The number of searches in the following examples have been limited for fast execution.  
## In practice, the number of searches may need to be increased for optimum results.
## Designs should be rebuilt several times to check that a near-optimum design has been found.  

# 12 treatments x 4 replicates in 4 complete blocks with 4 sub-blocks of size 3
# rectangular lattice see Plan 10.10 Cochran and Cox 1957.
blocks(treatments=12,replicates=4,blocks=c(4,4))

# 3 treatments x 2 replicates + 2 treatments x 4 replicates in two complete randomized blocks
blocks(treatments=c(3,2),replicates=c(2,4),searches=10)

# 50 treatments x 4 replicates with 4 main blocks and 5 nested sub-blocks in each main block
blocks(treatments=50,replicates=4,blocks=c(4,5))

# as above but with 20 additional single replicate treatments, one single treatment per sub-block
blocks(treatments=c(50,20),replicates=c(4,1),blocks=c(4,5))

# 6 replicates of 6 treatments in 4 blocks of size 9 (non-binary block design)
blocks(treatments=6,replicates=6,blocks=4)

# 128 treatments x 2 replicates with two main blocks and 3 levels of nesting
 ## No test: 
blocks(128,2,c(2,2,2,2))
## End(No test)

#' # 64 treatments x 4 replicates with 4 main blocks nested blocks of size 8 (lattice square)
blocks(64,4,c(4,8)) 

# 100 treatments x 4 replicates with 4 main blocks nested blocks of size 10 (lattice square)
blocks(100,4,c(4,10)) 




