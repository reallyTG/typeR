library(NEff)


### Name: population
### Title: individual based population model
### Aliases: population
### Keywords: effective population size annual effective size individual
###   based model heterozygosity demography life history population
###   development population growth

### ** Examples

# image you will run your population 3 times over 50 years 
# (note that more years and more repeats will lead to more precise results),
# your population contains 20 adults with a default 1:1 sex ratio,
# each female produces 2 offspring per year without variation in reproductive success
# and the adult survival rate is 0.7, then call your population as follows:
population(max.repeat=3, max.time=50, Na=20, n.recruit.fem=2, surv.ad.fem=0.7)

# you can adapt further life history parameters
# like a sex ratio of F:M = 1:0.67 (60% females)
# a male adult survival rate of 0.6
# non-constant population size and juvenile survival rate of 0.39
# and individuals reach sexual maturity at the age of 2
population(max.repeat=3, max.time=50, Na=20, sex.ratio=0.6, n.recruit.fem=2, delay=2,
surv.ad.fem=0.7, surv.ad.mal=0.6, surv.juv=0.39, const=FALSE)

# or you can include other genetic values like
population(max.repeat=3, max.time=50, Na=20, n.recruit.fem=2, surv.ad.fem=0.7, 
N.loci=15, N.allele=25)



