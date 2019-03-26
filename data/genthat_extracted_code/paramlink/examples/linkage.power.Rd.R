library(paramlink)


### Name: linkage.power
### Title: Power of a linkage study
### Aliases: linkage.power summary.powres

### ** Examples


# Note: In the examples below N is set very low in order to reduce time consumption. 
# Increase N to get more interesting results.

x = nuclearPed(3)
x = swapAff(x, c(1,3,4))
x = setModel(x, 1) # Autosomal dominant
linkage.power(x, N=1)

# X-linked recessive example:
y = linkdat(Xped, model=4)
linkage.power(y, N=1)

# Power of homozygosity mapping:
z = addOffspring(cousinPed(1), father=7, mother=8, noffs=1, aff=2)
z = setModel(z, 2) # Autosomal recessive model
pow = linkage.power(z, N=1, loop_breaker=7, seed=123)
stopifnot(round(pow$maxlod, 1) == 1.2)




