library(sharpr2)


### Name: find_reg
### Title: find_reg
### Aliases: find_reg
### Keywords: ATAC-STAR sharpr2

### ** Examples

data(hidra_ex)
re <- sharpr2(hidra_ex[1:2000,], l_min = 150, l_max = 600, f_dna = 5, f_rna = 0, sig=FALSE)
find_reg(re,1000000)



