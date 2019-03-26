library(CryptRndTest)


### Name: random.walk.tests
### Title: Random Walk Tests
### Aliases: random.walk.tests
### Keywords: Anderson-Darling Kolmogorov-Smirnov Chi-Square nonparametric
###   goodness-of-fit test randomness test

### ** Examples


RNGkind(kind = "Super-Duper")
B=64                        # Bit length is 64.
k=500                       # Generate 500 integers.
dat=round(runif(k,0,(2^B-1)))
x=sfsmisc::digitsBase(dat, base= 2, B) #Convert to base 2
alpha = 0.05
test=random.walk.tests(x, B, Excursion = TRUE, Expansion = TRUE, Height = TRUE, alpha)
print(test)




