library(paramlink)


### Name: twoMarkerDistribution
### Title: Genotype probability distribution
### Aliases: twoMarkerDistribution

### ** Examples


x = nuclearPed(2)
emptySNP = marker(x, alleles=c('a','b'))
SNP1 = marker(x, 1, c(1,1), 2, c(1,0), alleles=1:2, afreq=c(0.1, 0.9))
twoMarkerDistribution(x, id=2, emptySNP, SNP1, theta=0)
twoMarkerDistribution(x, id=2, emptySNP, SNP1, theta=0.5)
twoMarkerDistribution(x, id=3, emptySNP, SNP1, theta=0.5)

# X-linked example
SNPX_1 = marker(x, 2, c('a','b'), 3, 'b', alleles=c('a','b'), chrom=23)
SNPX_2 = marker(x, 2, c('a','b'), 3, 'b', alleles=c('a','b'), chrom=23)
r1 = twoMarkerDistribution(x, id=4, SNPX_1, SNPX_2, theta=0)
r2 = twoMarkerDistribution(x, id=4, SNPX_1, SNPX_2, theta=0.5)
stopifnot(all(r1==c(.5,0,0,.5)), all(r2==c(.25,.25,.25,.25)))




