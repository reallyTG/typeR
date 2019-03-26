library(copula)


### Name: khoudrajiCopula-class
### Title: Class '"khoudrajiCopula"' and its Subclasses
### Aliases: asymCopula-class asym2Copula-class khoudrajiCopula-class
###   khoudrajiBivCopula-class khoudrajiExplicitCopula-class
###   dim,khoudrajiCopula-method
### Keywords: classes

### ** Examples

showClass("khoudrajiCopula")# two subclasses

## all methods applicable to these subclasses:
(meths <- sapply(names(getClass("khoudrajiCopula")@subclasses),
                 function(CL) methods(class = CL),
                 simplify=FALSE))



