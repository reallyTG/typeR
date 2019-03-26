library(solarius)


### Name: phenodata
### Title: dat50 data set adapted from FFBSKAT R package
### Aliases: genocovdata genodata kin phenodata snpdata

### ** Examples

data(dat50)

str(phenodata)
plotKinship2(2*kin)
str(genodata)

genodata[1:5, 1:5]
str(genocovdata)

genocovdata[1:5, 1:5]

# compare with the genotypes
genodata[1:5, 1:5]
str(snpdata)

head(snpdata)



