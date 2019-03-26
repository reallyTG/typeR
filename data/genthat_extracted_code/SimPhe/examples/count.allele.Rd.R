library(SimPhe)


### Name: count.allele
### Title: Count allele frequencies
### Aliases: count.allele

### ** Examples

maf <- 0.1
x <- sample(0:2, 1000, replace = TRUE, prob = c((1-maf)^2, 2*(1-maf)*maf, maf^2))
table(x)
count.allele(x)



