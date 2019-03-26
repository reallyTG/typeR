library(sharpr2)


### Name: call_sig_reg
### Title: call_sig_reg
### Aliases: call_sig_reg
### Keywords: HiDRA sharpr2

### ** Examples

## No test: 
data(hidra_ex)
re  <- sharpr2(hidra_ex[1:2000,], l_min = 150, l_max = 600, f_dna = 5, f_rna = 0, sig=TRUE)
call_sig_reg(re,850, threshold=2.5)
## End(No test)



