library(AmpliconDuo)


### Name: AmpliconDuo-package
### Title: Statistical Analysis Of Amplicon Data Of The Same Sample To
###   Identify Artefacts
### Aliases: AmpliconDuo-package AmpliconDuo
### Keywords: package

### ** Examples


## load test amplicon frequency data ampliconfreqs and vector with sample names site.f
data(ampliconfreqs)
data(site.f)

## generating ampliconduo data frames 
## depending on the size if the data sets, may take some time
ampliconduoset <- ampliconduo(ampliconfreqs[,1:4], sample.names = site.f[1:2])

## plot amplicon read numbers of sample A  vs. amplicon read numbers of sample B,
## indicating amplicons with significant deviations in their occurence across samples
plotAmpliconduo.set(ampliconduoset, nrow = 3)

## calculate discordance between the two data sets of an ampliconduo
discordance <- discordance.delta(ampliconduoset)

## plot the odds ratio density of ampliconduo data
plotORdensity(ampliconduoset)

## apply filter criteria to remove/mark spurious amplicons
ampliconduoset.f <- filter.ampliconduo.set(ampliconduoset, min.freq = 1, q = 0.05)

## return indices of accepted amplicons, indices correspond to indices of the ampliconfreqs data, 
## that were used as input for the ampliconduo function
accep.reads <- accepted.amplicons(ampliconduoset.f)



