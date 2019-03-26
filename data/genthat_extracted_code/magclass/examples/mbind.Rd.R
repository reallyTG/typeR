library(magclass)


### Name: mbind
### Title: mbind
### Aliases: mbind mbind2

### ** Examples


m <- new.magpie(c("AFR","CPA","EUR"), c(1995,2005),"Data1",fill=c(1,2,3,4,5,6))
ms <- dimSums(m, dims=1)
mbind(m, ms)
my <- new.magpie(getRegions(m), 2010, getNames(m), fill=c(6,6,4))
mbind(m, my)
md <- new.magpie(getRegions(m), getYears(m), "Data2", fill=c(7,6,5,7,8,9))
mbind(m, md)

data(population_magpie)
a <- mbind(population_magpie,population_magpie)
dim(population_magpie)
dim(a)





