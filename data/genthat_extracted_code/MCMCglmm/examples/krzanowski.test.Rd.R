library(MCMCglmm)


### Name: krzanowski.test
### Title: Krzanowski's Comparison of Subspaces
### Aliases: krzanowski.test
### Keywords: multivariate

### ** Examples

CA<-rIW(diag(5),10, n=1)
CB<-rIW(diag(5),10, n=1)
krzanowski.test(CA, CB, vecsA=1:2, vecsB=1:2)
krzanowski.test(CA, CA, vecsA=1:2, vecsB=1:2)



