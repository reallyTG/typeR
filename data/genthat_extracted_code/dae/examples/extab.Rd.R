library(dae)


### Name: extab
### Title: Expands the values in table to a vector
### Aliases: extab
### Keywords: manip

### ** Examples

## generate a small completely randomized design with the two-level 
## factors A and B 
n <- 12
CRD.unit <- list(Unit = n)
CRD.treat <- fac.gen(list(A = 2, B = 2), each = 3)
CRD.lay <- designRandomize(allocated = CRD.treat, recipient = CRD.unit, 
                           seed = 956)

## set up a 2 x 2 table of A x B effects	
AB.tab <- c(12, -12, -12, 12)

## add a unit-length vector of expanded effects to CRD.lay
attach(CRD.lay)
CRD.lay$AB.effects <- extab(table=AB.tab, index.factors=list(A, B))



