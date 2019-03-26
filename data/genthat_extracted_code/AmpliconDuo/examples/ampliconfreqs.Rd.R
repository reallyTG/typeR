library(AmpliconDuo)


### Name: ampliconfreqs
### Title: SSU Amplicon Frequencies Of Different Sampling Sites (Short
###   Version)
### Aliases: ampliconfreqs
### Keywords: datasets

### ** Examples

data(ampliconfreqs)
data(site.f)
ampliconduo.a <- ampliconduo(ampliconfreqs[,1:4], sample.names = site.f[1:2])



