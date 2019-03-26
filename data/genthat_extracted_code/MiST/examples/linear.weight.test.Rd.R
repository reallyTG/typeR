library(MiST)


### Name: linear.weight.test
### Title: Weighted Mixed effects Score Test for continuous outcomes
### Aliases: linear.weight.test

### ** Examples

data(MiST.data)
attach(MiST.data)

##########################################################################
# Test the association between a set of SNPs and continuous outcomes    
#   - without information about SNP characteristics. Z is a vector of 1's.          


out <- linear.weight.test(y.con, X, G, Z, maf) 


##########################################################################
# Test the association between a set of SNPs and continuous outcomes    
#	- including SNP characteristics            


out <- linear.weight.test(y.con, X, G, Z.func, maf) 




