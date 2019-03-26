library(indicspecies)


### Name: nicheoverlap
### Title: Metrics to compare pairs of resource niches
### Aliases: nicheoverlap nichedispl

### ** Examples

# Loads example data
data(birds)

# The overlap and displacement metrics using distances among 
# resources and assuming equal availability of resources
nicheoverlap(birdsbreed, birdswinter, D = resourceD, mode="multiple") 
nichedispl(birdsbreed, birdswinter, D = resourceD, mode="multiple") 

# The overlap and displacement metrics using distances among resources
# and computes 95 percent confidence intervals
nicheoverlap(birdsbreed, birdswinter, D = resourceD, mode="multiple", 
Np1 = rowSums(birdsbreed), Np2 = rowSums(birdswinter), Nq1 = 100, Nq2 = 100) 
nichedispl(birdsbreed, birdswinter, D = resourceD, mode="multiple", 
Np1 = rowSums(birdsbreed), Np2 = rowSums(birdswinter), Nq1 = 100, Nq2 = 100) 

# Same computations with different resource availability
q = c(0.18, 0.24, 0.22, 0.21, 0.15)
nicheoverlap(birdsbreed, birdswinter, D = resourceD, 
q1 = q, q2 = q, mode="multiple")
nichedispl(birdsbreed, birdswinter, D = resourceD, 
q1 = q, q2 = q, mode="multiple")
nicheoverlap(birdsbreed, birdswinter, D = resourceD, 
q1 = q, q2 = q, mode="multiple", 
Np1 = rowSums(birdsbreed), Np2 = rowSums(birdswinter), 
Nq1 = 100, Nq2 = 100)
nichedispl(birdsbreed, birdswinter, D = resourceD, 
q1 = q, q2 = q, mode="multiple", 
Np1 = rowSums(birdsbreed), Np2 = rowSums(birdswinter), 
Nq1 = 100, Nq2 = 100)

# The overlap metrics using distances among rows of 'birdsbreed'
nicheoverlap(birdsbreed, D = resourceD, mode="pairwise") 



