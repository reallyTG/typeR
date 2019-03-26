library(CryptRndTest)


### Name: topological.binary
### Title: Topological Binary Test
### Aliases: topological.binary
### Keywords: nonparametric randomness test

### ** Examples

RNGkind(kind = "Super-Duper")
B=16                          # Bit length is 16.
k=5000                        # Generate 5000 integers.
dat=round(runif(k,0,(2^B-1)))
x=sfsmisc::digitsBase(dat, base= 2, B) #Convert to base 2
alpha = 0.05
critical.value=9245           #Obtained for B = 16
test=topological.binary(x, B, alpha, critical.value)
print(test)



