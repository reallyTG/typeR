library(tclust)


### Name: plot.DiscrFact
### Title: plot Method for DiscrFact Objects
### Aliases: plot.DiscrFact plot_DiscrFact_p2 plot_DiscrFact_p3
### Keywords: hplot cluster robust multivariate

### ** Examples

sig <- diag (2)
cen <- rep (1, 2)
x <- rbind(mvtnorm::rmvnorm(360, cen * 0,   sig),
	       mvtnorm::rmvnorm(540, cen * 5,   sig * 6 - 2),
	       mvtnorm::rmvnorm(100, cen * 2.5, sig * 50)
)

clus.1 <- tclust (x, k = 2, alpha=0.1, restr.fact=12)
clus.2 <- tclust (x, k = 3, alpha=0.1, restr.fact=1)

dsc.1 <- DiscrFact (clus.1)
plot(dsc.1)

dsc.2 <- DiscrFact (clus.2)
plot (dsc.2)

dev.off ()
plot_DiscrFact_p2 (dsc.1)
plot_DiscrFact_p3 (dsc.2)



