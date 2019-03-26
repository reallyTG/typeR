library(Replicate)


### Name: stronger_than
### Title: Probability of true effect stronger than threshold of scientific
###   importance
### Aliases: stronger_than

### ** Examples

# replication estimates (Fisher's z scale) and SEs
# from moral credential example in Mathur & VanderWeele
# (in preparation)
r.fis = c(0.303, 0.078, 0.113, -0.055, 0.056, 0.073,
0.263, 0.056, 0.002, -0.106, 0.09, 0.024, 0.069, 0.074,
0.107, 0.01, -0.089, -0.187, 0.265, 0.076, 0.082)

r.SE = c(0.111, 0.092, 0.156, 0.106, 0.105, 0.057,
0.091, 0.089, 0.081, 0.1, 0.093, 0.086, 0.076,
0.094, 0.065, 0.087, 0.108, 0.114, 0.073, 0.105, 0.04)

# meta-analyze the replications
library(metafor)
m = rma.uni( yi = r.fis, vi = r.SE^2, measure = "ZCOR" ) 

# probability of true effect above r = 0.10 = 28%
# convert threshold on r scale to Fisher's z
q = .5 * ( log(1 + 0.10) - log(1 - 0.10) )
stronger_than( q = q, yr = m$b, t2 = m$tau2, vyr = m$vb, vt2 = m$se.tau2^2, 
tail="above" )

# probability of true effect equally strong in opposite direction = very small
# convert threshold on r scale to Fisher's z
q.star = .5 * ( log(1 - 0.10) - log(1 + 0.10) )
stronger_than( q = q.star, yr = m$b, t2 = m$tau2, vyr = m$vb, vt2 = m$se.tau2^2, 
tail="below" )



