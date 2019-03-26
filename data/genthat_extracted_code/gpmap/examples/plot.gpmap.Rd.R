library(gpmap)


### Name: plot.gpmap
### Title: Functions for creating lineplots of genotype-phenotype (GP) maps
### Aliases: plot.gpmap plot.gpmap.decomp.mono

### ** Examples

data(GPmaps)

#plot additive gpmap
plot(A)

#plot decomposition of GPmap from Cheverud & Routman (1995)
decomp <- decompose_monotone(mouseweight)
plot(decomp, decomposed=TRUE)



