library(ICGE)


### Name: dbhatta
### Title: Bhattacharyya Distance
### Aliases: dbhatta
### Keywords: multivariate

### ** Examples

#Generate 10 objects in dimension 4. Number of trials M=30. 
#Frequencies obtained using tabulate function.
n <- 10
f <- matrix(0, n, 4)
M <- 30
for (i in 1:n){
    f[i,] <- tabulate(sample(1:4, M, replace=TRUE))/M
}


# Bhattacharyya distances between pairs 
d <- dbhatta(f)



