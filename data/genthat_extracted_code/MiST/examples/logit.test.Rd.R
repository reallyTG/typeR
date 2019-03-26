library(MiST)


### Name: logit.test
### Title: Mixed effects Score Test for binary outcomes
### Aliases: logit.test

### ** Examples

data(MiST.data)
attach(MiST.data)

######################################################################
# Test the association between a set of SNPs and binary outcomes    
#   - without information about SNP characteristics. Z is a vector of 1's.     

out <- logit.test(y.bin, X, G, Z) 


######################################################################
#	Test the association between a set of SNPs and bianry outcomes    
#	- including SNP characteristics        

out <- logit.test(y.bin, X, G, Z.func) 



