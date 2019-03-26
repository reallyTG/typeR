library(MiST)


### Name: logit.weight.test
### Title: Weighted Mixed effects Score Test for binary outcomes
### Aliases: logit.weight.test

### ** Examples

data(MiST.data)
attach(MiST.data)

######################################################################
# Test the association between a set of SNPs and binary outcomes    
#   - without information about SNP characteristics. Z is a vector of 1's.      

out <- logit.weight.test(y.bin, X, G, Z, maf) 


######################################################################
#	Test the association between a set of SNPs and bianry outcomes    
#	- including SNP characteristics        

out <- logit.weight.test(y.bin, X, G, Z.func, maf) 



