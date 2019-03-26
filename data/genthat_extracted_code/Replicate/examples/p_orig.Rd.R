library(Replicate)


### Name: p_orig
### Title: Statistical consistency of original study with replication
### Aliases: p_orig

### ** Examples

# replication estimates (Fisher's z scale) and SEs
# from moral credential example in Mathur and VanderWeele
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

p_orig( orig.y = 0.210, orig.vy = 0.062^2, 
yr = m$b, t2 = m$se.tau2^2,  vyr = m$vb )



