library(gpmap)


### Name: generate_gpmap
### Title: Function for creating genotype-phenotype (GP) maps
### Aliases: generate_gpmap gpmap

### ** Examples

#inter- and intra-locus additive GPmap with two loci 
generate_gpmap(c(-2,1,0,-1,0,1,0,1,2),mapnames="Additive") 

#two-locus GP map with AxA epistasis for loci named A and B
generate_gpmap(c(-1,0,1,0,0,0,1,0,-1),locinames=c("A","B"),mapnames="AxA")

#random GP map with 3 loci
set.seed(0)
generate_gpmap(rnorm(27))



