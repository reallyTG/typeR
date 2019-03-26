library(designGLMM)


### Name: updateDesign_CRD
### Title: Update function for Completely Randomised Design search
### Aliases: updateDesign_CRD

### ** Examples

# Suppose that we have a completely randomised design (1,1,1,1,2,2,2,3,3,3) and would like
# to replace exactly one entry with a randomly sampled treatment. Then we set the
# probability that one entry is replaced equal to 1.

updateDesign_CRD(des=c(1,1,1,1,2,2,2,3,3,3),ntmt=3,probs=c(1))

# Now suppose that we would like to replace one entry with probability 0.6 and replace
# two entries with probability 0.4 then probs=c(0.6,0.4).

updateDesign_CRD(des=c(1,1,1,1,2,2,2,3,3,3),ntmt=3,probs=c(0.6,0.4))



