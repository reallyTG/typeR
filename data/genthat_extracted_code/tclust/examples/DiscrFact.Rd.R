library(tclust)


### Name: DiscrFact
### Title: Discriminant Factor Analysis for tclust Objects
### Aliases: DiscrFact print.DiscrFact
### Keywords: hplot cluster robust multivariate

### ** Examples

sig <- diag (2)
cen <- rep (1, 2)
x <- rbind(mvtnorm::rmvnorm(360, cen * 0,   sig),
	       mvtnorm::rmvnorm(540, cen * 5,   sig * 6 - 2),
	       mvtnorm::rmvnorm(100, cen * 2.5, sig * 50)
)
clus.1 <- tclust (x, k = 2, alpha = 0.1, restr.fact = 12)

clus.2 <- tclust (x, k = 3, alpha = 0.1, restr.fact = 1)
  ##  restr.fact and k are chosen improperly for pointing out the 
  ##    difference in the plot of DiscrFact

dsc.1 <- DiscrFact (clus.1)
plot(dsc.1)

dsc.2 <- DiscrFact (clus.2)
plot (dsc.2)




