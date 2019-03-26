library(fam2r)


### Name: LRparamlink
### Title: Calculates likelihoods and likelihood ratios using 'paramlink'
### Aliases: LRparamlink

### ** Examples

data(adoption)
x = Familias2linkdat(adoption$pedigrees, adoption$datamatrix, adoption$loci)
result = LRparamlink(x, ref=2)
# Only marker 11 and 33
result33 = LRparamlink(x, ref=2, marker=c(11,33))



