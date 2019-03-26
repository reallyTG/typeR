library(rres)


### Name: populate.snp
### Title: Populate SNPs.
### Aliases: populate.snp

### ** Examples

# a simple pedigree with sibling marriage
pedigree = as.character(rep(1, 5))
member = as.character(c(11, 12, 21, 22, 31))
sex = as.numeric(c(1, 2, 1, 2, 1))
father = as.character(c(NA, NA, 11, 11, 21))
mother = as.character(c(NA, NA, 12, 12, 22))
pedinfo = data.frame(pedigree, member, sex, father, mother, stringsAsFactors = FALSE)

L = 100.0 # segment length
nsnp = 10 # number of SNPs
nhaplo = 4 # number of founder haplotypes
inher = sim.recomb(pedinfo, L)
haplo = matrix(c(3,4,4,4), nhaplo, nsnp)
marker = sort(runif(nsnp, 0, L))

# output genotype data for the 4th and 5th member
# of pedigree, genotype data displayed as two alleles
populate.snp(inher, haplo, marker, c(4, 5))

# output haplotype data for the 4th and 5th member of pedigree
populate.snp(inher, haplo, marker,c(4, 5), output.haplotype = TRUE)

# output genotype data for all members, genotype data
# displayed as counts of reference alleles
geno = recode.snpdata(haplo, input.haplotype = TRUE, output.haplotype = TRUE)[[1]]
populate.snp(inher, geno, marker, output.allele = FALSE)



