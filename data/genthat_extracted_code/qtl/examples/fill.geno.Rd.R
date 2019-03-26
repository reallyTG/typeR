library(qtl)


### Name: fill.geno
### Title: Fill holes in genotype data
### Aliases: fill.geno
### Keywords: utilities

### ** Examples

data(hyper)
## Don't show: 
hyper <- subset(hyper,chr=18:19)
## End(Don't show)
out.mr <- scantwo(fill.geno(hyper,method="argmax"), method="mr")
plot(out.mr)



