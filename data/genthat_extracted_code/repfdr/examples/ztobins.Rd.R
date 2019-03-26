library(repfdr)


### Name: ztobins
### Title: Binning of z-scores and estimation of the probabilities in each
###   bin for the null and non-null states.
### Aliases: ztobins

### ** Examples


# Simulated example using both the central proportion estimator 
# and the plug in estimator for the proportion of null hypotheses:

set.seed(1)
p = 10000
p1 = 300
z1 = (rnorm(p))
z2 = (rnorm(p))
temp = rnorm(p1, 3.5,0.5)
z1[1:p1] = temp + rnorm(p1,0,0.2)
z2[1:p1] = temp + rnorm(p1,0,0.2)

z1.abs = abs(z1)
z2.abs = abs(z2)
plot(z1,z2)
hist(z1)
hist(z2)

zmat.example = cbind(z1,z2)

ztobins.res = ztobins(zmat.example,
                      plot.diagnostics = TRUE)
ztobins.res$proportions

ztobins.res.plugin.estimator = ztobins(zmat.example,
                           pi.using.plugin = TRUE,
                           plot.diagnostics = TRUE)

ztobins.res.plugin.estimator$proportions

## Not run: 
##D 
##D # three association states case (H in {-1,0,1}):
##D download.file('http://www.math.tau.ac.il/~ruheller/repfdr_RData/zmat.RData',destfile = "zmat.RData")
##D load(file = "zmat.RData")
##D 
##D input.to.repfdr3 <- ztobins(zmat, 3, df = 15)
##D pbz    <- input.to.repfdr3$pdf.binned.z
##D bz     <- input.to.repfdr3$binned.z.mat
##D 
##D # two association states case (H in {0,1}):
##D data(zmat_sim)
##D 
##D input.to.repfdr <- ztobins(zmat_sim, 2, n.bins = 100 ,plot.diagnostics = T)
##D pbz_sim    <- input.to.repfdr$pdf.binned.z
##D bz_sim     <- input.to.repfdr$binned.z.mat
## End(Not run)




