library(genetics)


### Name: HWE.test
### Title: Estimate Disequilibrium and Test for Hardy-Weinberg Equilibrium
### Aliases: HWE.test HWE.test.genotype HWE.test.data.frame print.HWE.test
### Keywords: misc

### ** Examples

## Don't show: 
set.seed(4657613)
## End(Don't show)
## Marker with two alleles:
example.data   <- c("D/D","D/I","D/D","I/I","D/D",
                    "D/D","D/D","D/D","I/I","")
g1  <- genotype(example.data)
g1

HWE.test(g1)

## Compare with individual calculations:
diseq(g1)
diseq.ci(g1)
HWE.chisq(g1)
HWE.exact(g1)


## Marker with three alleles: A, C, and T
three.data   <- c(rep("A/A",16),
                  rep("C/A",40),
                  rep("C/T",40),
                  rep("C/C",20),
                  rep("T/T",6))

g3  <- genotype(three.data)
g3

HWE.test(g3, ci.B=10000)



