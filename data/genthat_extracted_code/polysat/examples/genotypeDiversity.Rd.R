library(polysat)


### Name: genotypeDiversity
### Title: Genotype Diversity Statistics
### Aliases: genotypeDiversity Shannon Simpson Simpson.var
### Keywords: arith

### ** Examples

# set up dataset
mydata <- new("genambig", samples=c("a","b","c"), loci=c("F","G"))
Genotypes(mydata, loci="F") <- list(c(115,118,124),c(115,118,124),
                                   c(121,124))
Genotypes(mydata, loci="G") <- list(c(162,170,174),c(170,172),
                                    c(166,180,182))
Usatnts(mydata) <- c(3,2)

# get genetic distances
mydist <- meandistance.matrix(mydata, all.distances=TRUE)

# calculate diversity under various conditions
genotypeDiversity(mydata, d=mydist)
genotypeDiversity(mydata, d=mydist, base=2)
genotypeDiversity(mydata, d=mydist, threshold=0.3)
genotypeDiversity(mydata, d=mydist, index=Simpson)
genotypeDiversity(mydata, d=mydist, index=Simpson.var)



