library(DoEstRare)


### Name: DoEstRare
### Title: DoEstRare
### Aliases: DoEstRare

### ** Examples

pheno=rep(c(0,1), 500)
geno=matrix(sample(c(0,1),prob=c(0.7,0.3) ,1000*30, replace=TRUE), ncol=30)
position=sample(1:500,30)
genome.size=500
perm=200

#Autosomal gene
#standard phenotype permutation procedure
DoEstRare(pheno, geno, position, genome.size, perm)
#adaptive phenotype permutation procedure
DoEstRare(pheno, geno, position, genome.size, alpha=0.05, c=0.2)

#X gene
gender=rep(c(1,2), each=500)
#standard phenotype permutation procedure
DoEstRare(pheno, geno, position, genome.size, perm, autosomal=FALSE, gender=gender)
#adaptive phenotype permutation procedure
DoEstRare(pheno, geno, position, genome.size, alpha=0.05, c=0.2, autosomal=FALSE, gender=gender)





