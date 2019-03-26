library(CryptRndTest)


### Name: GCD.test
### Title: GCD Test
### Aliases: GCD.test
### Keywords: Anderson-Darling Jarque-Bera Kolmogorov-Smirnov Chi-Square
###   nonparametric goodness-of-fit test randomness test

### ** Examples


RNGkind(kind = "L'Ecuyer-CMRG")
B=16                 # Bit length is 16. 
k=250                # Generate 250 integers.
x=array(0,dim=c(k,2))
x[,1]=round(runif(k,0,(2^B-1)))
x[,2]=round(runif(k,0,(2^B-1)))
mu=8.8772
sd=2.38282
alpha = 0.05
test=GCD.test(x,B=B,KS=TRUE,CSQ=TRUE,AD=TRUE,JB=TRUE,
              test.k=TRUE,test.g=TRUE,mu=mu,sd=sd,alpha=alpha)
print(test)




