library(stratification)


### Name: CochranHorganData
### Title: Populations Analyzed in Gunning and Horgan (2004) and Cochran
###   (1961)
### Aliases: Debtors UScities UScolleges USbanks
### Keywords: datasets

### ** Examples

### Reproduction of the results in Table 4 and Table 7 part 3 (case L=5) of  
### Gunning and Horgan (2004). The differences in the nh come from different  
### rounding. The more important differences observed for the cumulative  
### root frequency method are due to the use of different numbers of classes.
strata.geo(x=Debtors, n=100, Ls=5, alloc=c(0.5,0,0.5))
strata.cumrootf(x=Debtors, n=100, Ls=5, alloc=c(0.5,0,0.5), nclass=40)
strata.LH(x=Debtors, CV=0.0360, Ls=5, alloc=c(0.5,0,0.5), takeall=1, algo="Sethi")

strata.geo(x=UScities, n=100, Ls=5, alloc=c(0.5,0,0.5))
strata.cumrootf(x=UScities, n=100, Ls=5, alloc=c(0.5,0,0.5), nclass=40)
strata.LH(x=UScities, CV=0.0144, Ls=5, alloc=c(0.5,0,0.5), takeall=1, algo="Sethi")

strata.geo(x=UScolleges, n=100, Ls=5, alloc=c(0.5,0,0.5))
strata.cumrootf(x=UScolleges, n=100, Ls=5, alloc=c(0.5,0,0.5), nclass=40)
strata.LH(x=UScolleges, CV=0.0184, Ls=5, alloc=c(0.5,0,0.5), takeall=1, algo="Sethi")

strata.geo(x=USbanks, n=100, Ls=5, alloc=c(0.5,0,0.5))
strata.cumrootf(x=USbanks, n=100, Ls=5, alloc=c(0.5,0,0.5), nclass=40)
strata.LH(x=USbanks, CV=0.0110, Ls=5, alloc=c(0.5,0,0.5), takeall=1, algo="Sethi")



