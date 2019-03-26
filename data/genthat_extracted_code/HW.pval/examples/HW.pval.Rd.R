library(HW.pval)


### Name: HW.pval
### Title: Testing Hardy-Weinberg Equilibrium for Multiallelic Genes
### Aliases: HW.pval

### ** Examples

gen <- cbind(c(0,3,5,3),c(0,1,18,7),c(0,0,1,5),c(0,0,0,2))
print(gen)

#The upper triangle is unimportant so it is filled with 0's in this case

HW.pval(gen,num_simulations=10000,type="both")



