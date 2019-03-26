library(tclust)


### Name: plot.tclust
### Title: plot Method for tclust Objects
### Aliases: plot.tclust plot.tkmeans
### Keywords: hplot multivariate robust cluster

### ** Examples

#--- EXAMPLE 1------------------------------
sig <- diag (2)
cen <- rep (1, 2)
x <- rbind(mvtnorm::rmvnorm(360, cen * 0,   sig),
	       mvtnorm::rmvnorm(540, cen * 5,   sig * 6 - 2),
	       mvtnorm::rmvnorm(100, cen * 2.5, sig * 50)
)
# Two groups and 10% trimming level
a <- tclust (x, k = 2, alpha = 0.1, restr.fact = 12)

plot (a)
plot (a, labels = "observation")
plot (a, labels = "cluster")
plot (a, by.cluster = TRUE)

#--- EXAMPLE 2------------------------------
x <- c(	rnorm(72,	0,   1),
		rnorm(108, 10,   1),
		rnorm(20,  2.5, 10))

a <- tkmeans (x, k = 2, alpha = 0.1)
plot (a, jitter.y = TRUE)




