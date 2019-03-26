library(CryptRndTest)


### Name: book.stack
### Title: Book Stack Test
### Aliases: book.stack
### Keywords: Chi-Square nonparametric goodness-of-fit test randomness test

### ** Examples


RNGkind(kind = "L'Ecuyer-CMRG")
B=8                 # Bit length is 8. 
n=B*(2^(B/2))       # Number of required bits.
N=n/B               # Number of integers to be generated.
x=round(runif(N,0,(2^B-1)))
k=2                   # Divide alphabet to two sub-sets.
alpha=0.05
test=book.stack(x, B, k, alpha, bit = FALSE)
print(test)




