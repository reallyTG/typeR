library(kinship2)


### Name: familycheck
### Title: Error check for a family classification
### Aliases: familycheck
### Keywords: genetics

### ** Examples

# use 2 sample peds
data(sample.ped)
pedAll <- with(sample.ped, pedigree(id, father, mother, sex,
                    affected=cbind(affected, avail), famid=ped))

## check them giving separate ped ids
fcheck.sep <- with(sample.ped, familycheck(ped, id, father, mother))
fcheck.sep

## check assigning them same ped id
fcheck.combined <- with(sample.ped, familycheck(rep(1,nrow(sample.ped)), id, father, mother))
fcheck.combined

#make person 120's father be her son.
sample.ped[20,3] <- 131
fcheck1.bad <- try({with(sample.ped, familycheck(ped, id, father, mother))}, silent=FALSE)

## fcheck1.bad is a try-error



