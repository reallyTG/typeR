library(ElstonStewart)


### Name: es.pedigree
### Title: Creates a pedigree
### Aliases: es.pedigree print.es.pedigree

### ** Examples

## cf Elston-Stewart vignette for more coments on this example
data(conrad2)
# creating an es.pedigree object
genotypes <- c( rep(list(0:2), 21), 2 )

X <- es.pedigree( id = conrad2$id, father = conrad2$father, mother = conrad2$mother,
      sex = conrad2$sex, pheno = rep(0, 22), geno = genotypes )
X  # displays a short information on X



