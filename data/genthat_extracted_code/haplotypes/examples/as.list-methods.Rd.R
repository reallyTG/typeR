library(haplotypes)


### Name: as.list-methods
### Title: Methods for function 'as.list' in the Package 'haplotypes'
### Aliases: as.list as.list-methods as.list,Dna-method
###   as.list,Haplotype-method as.list,Parsimnet-method
### Keywords: DNA ANALYSIS HAPLOTYPE ANALYSIS STATISTICAL PARSIMONY

### ** Examples


data("dna.obj")

## Coercing a 'Dna' object to a list.
x<-dna.obj[1:3,as.matrix=FALSE]
as.list(x)

## Not run: 
##D ## Coercing a 'Haplotype' object to a list.
##D x<-dna.obj
##D h<-haplotype(x)
##D as.list(h)
##D 
##D ## Coercing a 'Parsimnet' object to a list.
##D x<-dna.obj
##D p<-parsimnet(x)
##D as.list(p)
## End(Not run)





