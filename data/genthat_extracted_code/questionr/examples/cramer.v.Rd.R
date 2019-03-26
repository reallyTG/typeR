library(questionr)


### Name: cramer.v
### Title: Compute Cramer's V of a two-way frequency table
### Aliases: cramer.v
### Keywords: univar

### ** Examples

data(Titanic)
tab <- apply(Titanic, c(4,1), sum)
#' print(tab)
cramer.v(tab)



