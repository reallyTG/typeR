library(AmpliconDuo)


### Name: ampliconduo
### Title: Apply Fisher's Exact Tests To Two Amplicon Frequency Sets Of The
###   Same Sample
### Aliases: ampliconduo
### Keywords: htest

### ** Examples


## loads read numbers from example amplicon data sets
data(ampliconfreqs)
data(site.f)

## generate ampliconduo data frames 
ampliconduos.a <- ampliconduo(A = ampliconfreqs[,1:4], sample.names = site.f[1:2])
ampliconduos.b <- ampliconduo(A = ampliconfreqs[c(1,3)],
B = ampliconfreqs[c(2,4)], sample.names = site.f[1:2],
conf.level = 0.9)

## frequency plot
plotAmpliconduo.set(ampliconduos.a)



