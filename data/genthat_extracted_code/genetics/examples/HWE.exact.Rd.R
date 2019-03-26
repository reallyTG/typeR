library(genetics)


### Name: HWE.exact
### Title: Exact Test of Hardy-Weinberg Equilibrium for 2-Allele Markers
### Aliases: HWE.exact
### Keywords: misc

### ** Examples

example.data   <- c("D/D","D/I","D/D","I/I","D/D",
                    "D/D","D/D","D/D","I/I","")
g1  <- genotype(example.data)
g1

HWE.exact(g1)
# compare with
HWE.chisq(g1)


## Don't show: 
set.seed(465764)
## End(Don't show)

g2 <- genotype(sample( c("A","C"), 100, p=c(100,10), rep=TRUE),
               sample( c("A","C"), 100, p=c(100,10), rep=TRUE) )
HWE.exact(g2)




