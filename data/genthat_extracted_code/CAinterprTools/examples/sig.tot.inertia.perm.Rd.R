library(CAinterprTools)


### Name: sig.tot.inertia.perm
### Title: Permuted significance of the CA total inertia
### Aliases: sig.tot.inertia.perm
### Keywords: sig.tot.inertia.perm

### ** Examples

data(greenacre_data)

#Returns the frequency distribution histogtam of the permuted total inertia
#(using 100 permutations). The observed total inertia and the 95th percentile
#of the permuted inertia are also displayed for testing the significance
#of the observed total inertia.
sig.tot.inertia.perm(greenacre_data, 100)




