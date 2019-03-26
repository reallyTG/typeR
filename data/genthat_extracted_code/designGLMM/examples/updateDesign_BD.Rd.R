library(designGLMM)


### Name: updateDesign_BD
### Title: Updating a Block Design
### Aliases: updateDesign_BD

### ** Examples

# Suppose that we have a block design ((1,1,2,2),(1,1,2,3),(1,2,2,3)) and would like to
# replace exactly one entry with a randomly sampled treatment. Then we set the probability
# that one entry is replaced equal to 1.

updateDesign_BD(des=c(1,1,2,2,1,1,2,3,1,2,2,3),ntmt=3,blksz=4,probs=c(1))

# Now suppose that we would like to replace one entry with probability 0.6 and replace
# two entries with probability 0.4 then probs=c(0.6,0.4).

updateDesign_BD(des=c(1,1,2,2,1,1,2,3,1,2,2,3),ntmt=3,blksz=4,probs=c(0.6,0.4))



