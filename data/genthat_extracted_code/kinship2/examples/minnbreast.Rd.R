library(kinship2)


### Name: minnbreast
### Title: Minnesota Breast Cancer Study
### Aliases: minnbreast minnbreast2
### Keywords: datasets

### ** Examples

data(minnbreast)
breastped <- with(minnbreast, pedigree(id, fatherid, motherid, sex,
                  status=(cancer& !is.na(cancer)), affected=proband,
                   famid=famid))
plot(breastped["8"])  #plot family 8, proband is solid, slash for cancers
#Note that breastped[8] is a different family, since ids are not 1,2,3,...



