library(CorrBin)


### Name: ran.CMData
### Title: Generate a random CMData object
### Aliases: ran.CMData
### Keywords: distribution

### ** Examples

# Resample from the dehp dataset
data(dehp)
ran.dehp <- ran.CMData(20, 3, 10, list(multinom.gen=mg.Resample, param=list(data=dehp)))

# Dirichlet-Multinomial distribution with two treatment groups and random cluster sizes
binom.cs <- function(n){rbinom(n, p=0.3, size=10)+1}
dm1 <- ran.CMData(15, 4, binom.cs,
                  list(multinom.gen=mg.DirMult, param=list(shape=c(2,3,2,1))))
dm2 <- ran.CMData(15, 4, binom.cs,
                  list(multinom.gen=mg.DirMult, param=list(shape=c(1,1,4,1))))
ran.dm <- rbind(dm1, dm2)

# Logit-Normal multinomial distribution
ran.ln <- ran.CMData(13, 3, 3,
                     list(multinom.gen=mg.LogitNorm,
                          param=list(mu=c(-1, 1), sigma=matrix(c(1,0.8,0.8,2), nr=2))))

# Mixture of two multinomial distributions
unif.cs <- function(n){sample(5:9, size=n, replace=TRUE)}
ran.mm <- ran.CMData(6, 3, unif.cs,
                     list(multinom.gen=mg.MixMult,
                          param=list(q=c(0.8,0.2), m=rbind(c(-1,0), c(0,2)))))



