library(BHH2)


### Name: permtest
### Title: Permutation test: randomization test for small size samples
### Aliases: permtest
### Keywords: design distribution

### ** Examples

library(BHH2)

# Permutation test for Tomato Data
data(tomato.data)
cat("Tomato Data (not paired):\n")
attach(tomato.data)
a <- pounds[fertilizer=="A"]
b <- pounds[fertilizer=="B"]
print(round(test <- permtest(b,a),3))
detach()

# Permutation test for Boy's Shoes Example
data(shoes.data)
cat("Shoes Data (paired):\n")
attach(shoes.data)
x <- matB-matA
print(round(test <- permtest(x),3))
detach()




