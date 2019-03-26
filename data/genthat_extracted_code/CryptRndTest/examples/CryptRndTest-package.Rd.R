library(CryptRndTest)


### Name: CryptRndTest-package
### Title: Statistical Tests for Cryptographic Randomness
### Aliases: CryptRndTest-package CryptRndTest
### Keywords: Anderson-Darling, chi-Square, goodness-of-fit test, greatest
###   common divisor, Stirling numbers of the second kind, Jarque-Bera,
###   Kolmogorov-Smirnov, nonparametric, randomness test

### ** Examples

# ----- General settings ---
RNGkind(kind = "Super-Duper")
B=8                  # Bit length is 8.
k=2000               # Generate 20000 integers.
alpha=0.05

# ----- Adaptive chi-square -----
A=0
A=round(runif(k,0,(2^B-1)))
S=2                 # Divide alphabet to two sub-sets.
test1=adaptive.chi.square(x=A, B, S, alpha, bit = FALSE)
print(test1)

# ----- Birthday Spacings -----
m=16                  # Number of birthdays is 16.
n=2^B                 # Length of year is 256.
lambda=(m^3)/(4*n)     
x=round(runif(k,0,(2^B-1)))
test2=birthday.spacings(x, m, n, alpha, lambda, num.class=10)
print(test2)

# ----- Book Stack -----
n=B*(2^(B/2))         # Number of required bits.
N=n/B                 # Number of integers to be generated.
A=0
A=round(runif(N,0,(2^B-1)))
K=2                   # Divide alphabet to two sub-sets.
test3=book.stack(x=A, B, k = K, alpha, bit = FALSE)
print(test3)

# ----- Toplogical Binary Test -----

dat=round(runif(k,0,(2^B-1)))
x=sfsmisc::digitsBase(dat, base= 2, B) #Convert to base 2
critical.value=150                     #Obtained for B=8
test4=topological.binary(x, B, alpha, critical.value)
print(test4)

# ----- Other Functions -----
# ----- GCD -----
result=GCD(45,2)
print(result)

result=GCD(321235,25521)
print(result)

# ----- Striling 2 -----
Strlng2(1500,410,log=TRUE)  # Large values of n and k



