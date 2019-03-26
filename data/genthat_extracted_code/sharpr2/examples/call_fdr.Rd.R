library(sharpr2)


### Name: call_fdr
### Title: call_fdr
### Aliases: call_fdr
### Keywords: HiDRA sharpr2

### ** Examples


## No test: 
data(hidra_ex)
whole_re <- sharpr2(hidra_ex, l_min = 150, l_max = 600, f_dna = 5, f_rna = 0, sig=FALSE)
call_fdr(list(whole_re))
## End(No test)




