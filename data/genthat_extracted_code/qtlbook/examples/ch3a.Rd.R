library(qtlbook)


### Name: ch3a
### Title: Data with a phenotype error
### Aliases: ch3a
### Keywords: datasets

### ** Examples

data(ch3a)

# phenotype problem
pairs(ch3a$pheno)
ch3a$pheno[ch3a$pheno[,4]==0,] # individual 159

# individuals with similar genotypes
cg <- comparegeno(ch3a)
hist(cg, breaks=200)
max(cg[cg < 1])
which(cg == max(cg[cg < 1]), arr.ind=TRUE)



