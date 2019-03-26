library(rres)


### Name: ibd.marker
### Title: Score IBD sharing at a list of marker positions.
### Aliases: ibd.marker

### ** Examples

# a simple pedigree with sibling marriage
pedigree = as.character(rep(1, 5))
member = as.character(c(11, 12, 21, 22, 31))
sex = as.numeric(c(1, 2, 1, 2, 1))
father = as.character(c(NA, NA, 11, 11, 21))
mother = as.character(c(NA, NA, 12, 12, 22))
pedinfo = data.frame(pedigree, member, sex, father, mother, stringsAsFactors = FALSE)
inheritance = sim.recomb(pedinfo, 100)
nsnp = 10
marker = sort(runif(nsnp, 0, 100))

# IBD at markers between the two haplotypes of the inbred individual
ibd.marker(inheritance, marker, 5)

# IBD at markers between the two full sibs, with different IBD coding
ibd.marker(inheritance, marker, 3, 4) # relatedness
ibd.marker(inheritance, marker, 3, 4, relatedness = FALSE) # lexicographical order of IBD state



