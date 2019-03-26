library(mopa)


### Name: biomat
### Title: Matrix with variables for modelling
### Aliases: biomat
### Keywords: internal

### ** Examples

## Load climate data
destfile <- tempfile()
data.url <- "https://raw.githubusercontent.com/SantanderMetGroup/mopa/master/data/biostack.rda"
download.file(data.url, destfile)
load(destfile, verbose = TRUE)

## Load and prepare presence data
data(Oak_phylo2)
dfp <-cbind(Oak_phylo2[[1]], "pa"= rep(1,nrow(Oak_phylo2[[1]])))
dfa <-cbind(Oak_phylo2[[2]], "pa"= rep(0,nrow(Oak_phylo2[[2]])))
df3 <-rbind(dfp, dfa)

## Build the data matrix for modeling
mat <-biomat(df3, biostack$baseline)
str(mat)




