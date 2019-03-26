library(ElstonStewart)


### Name: Elston
### Title: Compute a probability function on a pedigree
### Aliases: Elston

### ** Examples

## cf Elston-Stewart vignette for more coments on this example
data(conrad2)
# creating an es.pedigree object
genotypes <- c( rep(list(0:2), 21), 2 )

X <- es.pedigree( id = conrad2$id, father = conrad2$father, mother = conrad2$mother, 
      sex = conrad2$sex, pheno = rep(0, 22), geno = genotypes )

# running Elston-Stewart
r <- Elston(X, modele.di, list(p = 0.98))
r$result

# using the memoization...
r <- Elston(X, modele.di, list(p = 0.99), r$mem)
r$result



