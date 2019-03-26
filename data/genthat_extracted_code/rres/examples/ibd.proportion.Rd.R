library(rres)


### Name: ibd.proportion
### Title: Score IBD proportion.
### Aliases: ibd.proportion

### ** Examples

# a simple pedigree with sibling marriage
pedigree = as.character(rep(1, 5))
member = as.character(c(11, 12, 21, 22, 31))
sex = as.numeric(c(1, 2, 1, 2, 1))
father = as.character(c(NA, NA, 11, 11, 21))
mother = as.character(c(NA, NA, 12, 12, 22))
pedinfo = data.frame(pedigree, member, sex, father, mother, stringsAsFactors = FALSE)
inheritance = sim.recomb(pedinfo, 100)

# realized inbreeding of inbred child
get.pedindex(pedinfo, "31")
ibd.proportion(inheritance, 5)

# realized relatedness between individual 21 and 22 (parents of inbred child)
get.pedindex(pedinfo, c("21", "22"))
ibd.proportion(inheritance, 3, 4)



