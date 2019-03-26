library(RInSp)


### Name: Null.Hp.RInSp
### Title: Generate a data set based on a specific null hypothesis
### Aliases: Null.Hp.RInSp
### Keywords: univar models

### ** Examples

# Example with stickleback data from Bolnick and Paull 2009
data(Stickleback)
# Null model using a specified data set
SiteA = import.RInSp(Stickleback, row.names = 1,
info.cols = c(2:13), subset.rows = c("Site", "A"))
Eresult = Eindex(SiteA, index = "saramaki", jackknife = FALSE)
Nulldata = Null.Hp.RInSp(SiteA, prop="average")
Eresult = Eindex(Nulldata, index = "saramaki", jackknife = FALSE)

# Null model with diet and per individual resource
# Generate a number-of-items-per-individual vector for 30 individuals
ind.resources = floor(runif(30, 15, 120))
# Generate a population diet with 6 items
diet = c(10, 30, 15, 60, 100)
Nulldata2 = Null.Hp.RInSp(ind.resources, prop= diet)
Eresult2 = Eindex(Nulldata2, index = "saramaki", jackknife = FALSE)
rm(list=ls(all=TRUE))



