library(quad)


### Name: quadp
### Title: This function provides you the pvalue based on the Pearson
###   Family distribution.
### Aliases: quadp
### Keywords: quadp

### ** Examples

#####  m is the dimension of the A matrix, n is the length of y        ##
#####  no row/column of A can be all constant, as this is degenerate and creates problems. 
library(PearsonDS)

m=15
n=20
set.seed(1)
x=matrix(rnorm(m*n),m,n) # just an example
y=rnorm(n)     
A=t(x-rowMeans(x))
data(mycoef)
##### The code below assumes that y and A have been presepecified or otherwise preloaded
#result=quadp(y,A,mycoef)
#print(result)



