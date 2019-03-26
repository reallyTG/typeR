library(IFP)


### Name: error.rates
### Title: Error Rates Estimation for Likelihood Ratio Tests Designed for
###   Identifying Number of Functional Polymorphisms
### Aliases: error.rates

### ** Examples

## LRT tests when SNP1 & SNP6 are the functional polymorphisms.


data(apoe)

n<-c(2000, 2000, 2000, 2000, 2000, 2000, 2000) #case sample size = 1000
x<-c(1707, 281,1341, 435, 772, 416, 1797) #allele numbers in case samples 

Z<-2 	#number of functional SNPs for tests
n.poly<-ncol(apoe7)/2 	#total number of SNPs

#index number for the model in this case is 5 for SNP1 and 6. 
#apoe7 is considered to represent the true control allele and haplotype frequencies.
#Control sample size = 1000.

error.rates(5, 2, x/n, apoe7, 2000, 2000, sim.no=2)

# to obtain valid rates, use sim.no=1000.




