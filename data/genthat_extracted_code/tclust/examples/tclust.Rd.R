library(tclust)


### Name: tclust
### Title: General Trimming Approach to Robust Cluster Analysis
### Aliases: ' tclust ' ' print.tclust '
### Keywords: multivariate robust cluster

### ** Examples

## Don't show: 
set.seed (0)
## End(Don't show)
#--- EXAMPLE 1 ------------------------------------------
sig <- diag (2)
cen <- rep (1,2)
x <- rbind(mvtnorm::rmvnorm(360, cen * 0,   sig),
           mvtnorm::rmvnorm(540, cen * 5,   sig * 6 - 2),
           mvtnorm::rmvnorm(100, cen * 2.5, sig * 50)
           )

# Two groups and 10% trimming level
clus <- tclust (x, k = 2, alpha = 0.1, restr.fact = 8)

plot (clus)
plot (clus, labels = "observation")
plot (clus, labels = "cluster")

# Three groups (one of them very scattered) and 0% trimming level
clus <- tclust (x, k = 3, alpha=0.0, restr.fact = 100)

plot (clus)


#--- EXAMPLE 3 ------------------------------------------
data (M5data)
x <- M5data[, 1:2]

clus.a <- tclust (x, k = 3, alpha = 0.1, restr.fact =  1,
                  restr = "eigen", equal.weights = TRUE, warnings = 1)
clus.b <- tclust (x, k = 3, alpha = 0.1, restr.fact =  1,
                   equal.weights = TRUE, warnings = 1)
clus.c <- tclust (x, k = 3, alpha = 0.1, restr.fact =  1,
                  restr = "deter", equal.weights = TRUE, iter.max = 100,
		  warnings = 1)
clus.d <- tclust (x, k = 3, alpha = 0.1, restr.fact = 50,
                  restr = "eigen", equal.weights = FALSE)

pa <- par (mfrow = c (2, 2))
plot (clus.a, main = "(a) tkmeans")
plot (clus.b, main = "(b) Gallegos and Ritter")
plot (clus.c, main = "(c) Gallegos")
plot (clus.d, main = "(d) tclust")
par (pa)

#--- EXAMPLE 4 ------------------------------------------
data (swissbank)
# Two clusters and 8% trimming level
clus <- tclust (swissbank, k = 2, alpha = 0.08, restr.fact = 50)

                            # Pairs plot of the clustering solution
pairs (swissbank, col = clus$cluster + 1)
                                  # Two coordinates
plot (swissbank[, 4], swissbank[, 6], col = clus$cluster + 1,
     xlab = "Distance of the inner frame to lower border",
     ylab = "Length of the diagonal")
plot (clus)

# Three clusters and 0% trimming level
clus <- tclust (swissbank, k = 3, alpha = 0.0, restr.fact = 110)

                            # Pairs plot of the clustering solution
pairs (swissbank, col = clus$cluster + 1)

                                   # Two coordinates
plot (swissbank[, 4], swissbank[, 6], col = clus$cluster + 1, 
      xlab = "Distance of the inner frame to lower border", 
      ylab = "Length of the diagonal")

plot (clus)

## Don't show: 
## End(Don't show)



