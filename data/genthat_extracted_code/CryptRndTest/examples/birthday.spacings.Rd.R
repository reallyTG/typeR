library(CryptRndTest)


### Name: birthday.spacings
### Title: Birthday Spacings Test
### Aliases: birthday.spacings
### Keywords: Anderson-Darling Kolmogorov-Smirnov Chi-Square nonparametric
###   goodness-of-fit test randomness test

### ** Examples


RNGkind(kind = "L'Ecuyer-CMRG")
B=16                  # Bit length is 16.
m=32                  # Number of birthdays is 64.
n=2^B                 # Length of year is 65536.
lambda=(m^3)/(4*n)     
k=5000                # Generate 5000 integers.
x=round(runif(k,0,(2^B-1)))
alpha = 0.05
test=birthday.spacings(x, m, n, alpha, lambda, num.class=10)
print(test)




