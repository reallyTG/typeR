library(PBImisc)


### Name: musculus
### Title: A dataset relatead to mice musculus growth which depends on diet
###   and genetic structure
### Aliases: musculus muscle
### Keywords: musculus

### ** Examples

## Not run: 
##D    require(kinship2)
##D    pedmus <- pedigree(musculus$id, musculus$dadid, musculus$momid, musculus$sex)
##D    plot(pedmus, affected=musculus$diet)
##D 
##D    fam  <- makefamid(musculus$id, musculus$dadid, musculus$momid)
##D    kmatrix <- makekinship(fam, musculus$id, musculus$dadid, musculus$momid)
##D    kmatrix[1:5,1:15]
## End(Not run)



