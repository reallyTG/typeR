library(genetics)


### Name: HWE.chisq
### Title: Perform Chi-Square Test for Hardy-Weinberg Equilibrium
### Aliases: HWE.chisq HWE.chisq.genotype
### Keywords: misc

### ** Examples

## Don't show: 
set.seed(4657613)
## End(Don't show)
example.data   <- c("D/D","D/I","D/D","I/I","D/D",
                    "D/D","D/D","D/D","I/I","")
g1  <- genotype(example.data)
g1

HWE.chisq(g1)
# compare with
HWE.exact(g1)
# and 
HWE.test(g1)

three.data   <- c(rep("A/A",8),
                  rep("C/A",20),
                  rep("C/T",20),
                  rep("C/C",10),
                  rep("T/T",3))

g3  <- genotype(three.data)
g3

HWE.chisq(g3, B=10000)





