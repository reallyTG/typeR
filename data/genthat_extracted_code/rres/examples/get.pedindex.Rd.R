library(rres)


### Name: get.pedindex
### Title: Get pedigree index.
### Aliases: get.pedindex

### ** Examples

# a simple pedigree with sibling marriage
pedigree = as.character(rep(1, 5))
member = as.character(c(11, 12, 21, 22, 31))
sex = as.numeric(c(1, 2, 1, 2, 1))
father = as.character(c(NA, NA, 11, 11, 21))
mother = as.character(c(NA, NA, 12, 12, 22))
pedinfo = data.frame(pedigree, member, sex, father, mother, stringsAsFactors = FALSE)

get.pedindex(pedinfo, c("22", "31"))



