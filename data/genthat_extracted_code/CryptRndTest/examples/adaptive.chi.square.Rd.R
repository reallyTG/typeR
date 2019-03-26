library(CryptRndTest)


### Name: adaptive.chi.square
### Title: Adaptive Chi-Square Test
### Aliases: adaptive.chi.square
### Keywords: goodness-of-fit test randomness test nonparametric

### ** Examples


RNGkind(kind = "Super-Duper")
B=16                  # Bit length is 16.
k=5000                # Generate 5000 integers.
x=0
x=round(runif(k,0,(2^B-1)))
S=2                   # Divide alphabet to two subsets.
alpha = 0.05
test=adaptive.chi.square(x, B, S, alpha, bit =FALSE)
print(test)



