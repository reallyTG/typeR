library(mmod)


### Name: rgenotypes
### Title: Randomly create genotypes
### Aliases: rgenotypes

### ** Examples


data(nancycats)
obs_allele_freqs <- apply(nancycats$tab[,1:16], 2,mean, na.rm=TRUE)
rgenotypes(10, 2, obs_allele_freqs)



