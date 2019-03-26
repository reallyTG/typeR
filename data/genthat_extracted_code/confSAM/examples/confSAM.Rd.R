library(confSAM)


### Name: confSAM
### Title: Permutation-based confidence bounds for the false discovery
###   proportion
### Aliases: confSAM

### ** Examples

#This is a fast example. It is recommended to take w and ncombs larger in practice.
set.seed(423)
m <- 100   #number of hypotheses
n <- 10    #the amount of subjects is 2n (n cases, n controls).
w <- 50   #number of random permutations. Here we take w small for computational speed

X <- matrix(rnorm((2*n)*m), 2*n, m)
X[1:n,1:50] <- X[1:n,1:50]+1.5 # the first 50 hypotheses are false
#(increased mean for the first n individuals).

y <- c(numeric(n)+1,numeric(n)-1)
Y <- t(replicate(w, sample(y, size=2*n, replace=FALSE)))
Y[1,] <- y  #add identity permutation

pvalues <- matrix(nrow=w,ncol=m)
for(j in 1:w){
  for(i in 1:m){
    pvalues[j,i] <- t.test( X[Y[j,]==1,i], X[Y[j,]==-1,i] ,
                            alternative="two.sided" )$p.value
  }
}

## number of rejections:
confSAM(p=pvalues[1,], PM=pvalues, cutoff=0.05, alpha=0.1, method="simple")[1]

## basic median unbiased estimate of #false positives:
confSAM(p=pvalues[1,], PM=pvalues, cutoff=0.05, alpha=0.1, method="simple")[2]

## basic (1-alpha)-upper bound for #false positives:
confSAM(p=pvalues[1,], PM=pvalues, cutoff=0.05, alpha=0.1, method="simple")[3]

## potentially smaller (1-alpha)-upper bound for #false positives:
## (taking 'ncombs' much larger recommended)
confSAM(p=pvalues[1,], PM=pvalues, cutoff=0.05, alpha=0.1, method="approx",
        ncombs=50)[3]


## actual number of false positives:
sum(pvalues[1,51:100]<0.05)




