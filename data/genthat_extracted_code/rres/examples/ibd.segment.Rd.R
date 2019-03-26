library(rres)


### Name: ibd.segment
### Title: Score IBD sharing by segment.
### Aliases: ibd.segment

### ** Examples

# a simple pedigree with sibling marriage
pedigree = as.character(rep(1, 5))
member = as.character(c(11, 12, 21, 22, 31))
sex = as.numeric(c(1, 2, 1, 2, 1))
father = as.character(c(NA, NA, 11, 11, 21))
mother = as.character(c(NA, NA, 12, 12, 22))
pedinfo = data.frame(pedigree, member, sex, father, mother, stringsAsFactors = FALSE)
inheritance = sim.recomb(pedinfo, 100)

# IBD segments between the two haplotypes of the inbred individual
ibd.segment(inheritance, 5)

# IBD segments between the two full sibs
ibd.segment(inheritance, 3, 4) # relatedness
ibd.segment(inheritance, 3, 4, relatedness = FALSE) # lexicographical order of IBD state



