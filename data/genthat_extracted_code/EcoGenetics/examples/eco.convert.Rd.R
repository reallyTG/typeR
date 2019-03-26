library(EcoGenetics)


### Name: eco.convert
### Title: Conversion utility for genetic data
### Aliases: eco.convert

### ** Examples


## Not run: 
##D 
##D data(eco3)
##D 
##D # One allele per column
##D loc2al <- eco.convert(eco3[["G"]], "matrix", "alleles.matrix", ploidy = 2)
##D loc2al     
##D 
##D # Inverse operation (collapse alleles into locus)
##D al2loc <- eco.convert(loc2al, "alleles.matrix", "matrix", ploidy = 2)
##D al2loc
##D 
##D # Separating alleles with a character string
##D loc2loc <- eco.convert(eco3[["G"]], "matrix", "matrix", ploidy = 2, sep.out = "/")
##D loc2loc
##D 
##D # Inverse operation (removing separator)
##D loc2loc.nosep <- eco.convert(loc2loc, "matrix", "matrix", ploidy = 2, sep.in = "/", sep.out = "")
##D loc2loc.nosep
##D 
##D # Locus to list
##D loc2list <- eco.convert(eco3[["G"]], "matrix", "list", ploidy = 2)
##D loc2list
##D 
##D # Locus to allele list
##D al2list <- eco.convert(eco3[["G"]], "matrix",  "alleles.list", ploidy = 2)
##D al2list
##D 
##D # The inverse operations are also defined. All the formats are interconvertible.
##D # Locus operations have defined a within operation (matrix to matrix, list to list), 
##D # with the purpose of put/remove separators between alleles. The program accepts any ploidy level. 
##D 
##D 
## End(Not run)




