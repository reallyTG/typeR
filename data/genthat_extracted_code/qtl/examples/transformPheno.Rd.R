library(qtl)


### Name: transformPheno
### Title: Transformation of the phenotypes in a cross object
### Aliases: transformPheno
### Keywords: utilities

### ** Examples

data(multitrait)

# Log transformation of all phenotypes
multitrait.log <- transformPheno(multitrait, pheno.col=1:nphe(multitrait))

# Square-root transformation of all phenotypes
multitrait.sqrt <- transformPheno(multitrait, pheno.col=1:nphe(multitrait),
                                  transf=sqrt)



