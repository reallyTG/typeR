library(qtl)


### Name: getid
### Title: Pull out the individual identifiers from a cross
### Aliases: getid
### Keywords: utilities

### ** Examples

data(fake.f2)

# create an ID column
fake.f2$pheno$id <- paste("ind", sample(nind(fake.f2)), sep="")

getid(fake.f2)



