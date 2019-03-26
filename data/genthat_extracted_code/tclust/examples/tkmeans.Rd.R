library(tclust)


### Name: tkmeans
### Title: Trimmed k-means Cluster Analysis
### Aliases: ' tkmeans '
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
clus <- tkmeans (x, k = 2, alpha = 0.1)

plot (clus)
plot (clus, labels = "observation")
plot (clus, labels = "cluster")

#--- EXAMPLE 2 ------------------------------------------
data (geyser2)
clus <- tkmeans (geyser2, k = 3, alpha = 0.03)
plot (clus)

#--- EXAMPLE 3 ------------------------------------------
data (swissbank)
# Two clusters and 8% trimming level
clus <- tkmeans (swissbank, k = 2, alpha = 0.08)

                            # Pairs plot of the clustering solution
pairs (swissbank, col = clus$cluster + 1)
                                  # Two coordinates
plot (swissbank[, 4], swissbank[, 6], col = clus$cluster + 1,
     xlab = "Distance of the inner frame to lower border",
     ylab = "Length of the diagonal")
plot (clus)

# Three clusters and 0% trimming level
clus <- tkmeans (swissbank, k = 3, alpha = 0.0)

                            # Pairs plot of the clustering solution
pairs (swissbank, col = clus$cluster + 1)

                                   # Two coordinates
plot (swissbank[, 4], swissbank[, 6], col = clus$cluster + 1, 
      xlab = "Distance of the inner frame to lower border", 
      ylab = "Length of the diagonal")

plot (clus)




