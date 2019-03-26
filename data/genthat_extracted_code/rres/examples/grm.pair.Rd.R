library(rres)


### Name: grm.pair
### Title: GRM for a pair of individuals.
### Aliases: grm.pair

### ** Examples

# simulate genotypes for a full sib pair
pedigree = as.character(rep(1, 4))
member = as.character(c(11, 12, 21, 22))
sex = as.numeric(c(1, 2, 1, 2))
father = as.character(c(NA, NA, 11, 11))
mother = as.character(c(NA, NA, 12, 12))
pedinfo = data.frame(pedigree, member, sex, father, mother, stringsAsFactors = FALSE)
set.seed(1)
inher = sim.recomb(pedinfo, 3500) # on a hypothetical chromosome

nsnp = 100000
marker = seq(0,3500,length.out=nsnp)
freq = runif(nsnp, 0.05, 0.95)
haplo = sim.haplotype(freq, 4)
geno = populate.snp(inher, haplo, marker, output.allele = FALSE)

# simulation truth
ibd.proportion(inher,3,4)

# different GRM estimates
grm.pair(geno[3,], geno[4,], freq, method = "twostep")
grm.pair(geno[3,], geno[4,], freq, method = "classic")
grm.pair(geno[3,], geno[4,], freq, method = "robust")
grm.pair(geno[3,], geno[4,], freq, method = "general", weights = sample(freq, nsnp)/sum(freq))

# compute the relatedness matrix
grm.matrix(geno, freq)
grm.matrix(geno, freq, method = "robust")



