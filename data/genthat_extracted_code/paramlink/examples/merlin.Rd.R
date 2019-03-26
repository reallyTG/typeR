library(paramlink)


### Name: merlin
### Title: MERLIN wrappers
### Aliases: merlin merlinUnlikely

### ** Examples


## Not run: 
##D x = linkdat(toyped, model=1)
##D x
##D 
##D # MERLIN treats partial genotypes (i.e. one known and one unknown allele) as missing:
##D lod_merlin = merlin(x)
##D lod_partial = lod(x)
##D x = modifyMarker(x, marker=1, ids=1, genotype=0)
##D lod_missing = lod(x)
##D stopifnot(lod_merlin == round(lod_missing, 4))
##D 
##D # Likelihood computation by MERLIN:
##D merlin(x, model=F, options='--lik')
## End(Not run)




