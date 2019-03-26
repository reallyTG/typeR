library(TwoSampleTest.HD)


### Name: TwoSampleTest.HD
### Title: A two-sample test for the equality of distributions for
###   high-dimensional data
### Aliases: TwoSampleTest.HD

### ** Examples

## Don't show: 
# Example
### Data set to check the performance of the code

p <- 100
n <- 5
m <- 5

X <- matrix(rnorm(p * n), ncol = n)
Y <- matrix(rnorm(p * n), ncol = n)
system.time(res <- TwoSampleTest.HD(X, Y, method = "perm"))
## End(Don't show)


## No test: 
# We consider a simulated data example. We have simulated the following situation.
# We have two groups, for example, 7 patients with tumor 1 and 7 patients with tumor 2.
# For each patient 1000 variables are measured, for example, gene expression levels.
# Besides, the distributions of 100 of the variables are different in the two groups,
# and the differences are in terms of location. The variables are independent to
# simplify the generation of the data sets.
p <- 1000
n = m = 7
inds <- sample(1:4, p, replace = TRUE)
X <- matrix(rep(0, n * p), ncol = n)
for (j in 1:p){
  if (inds[j] == 1){
    X[j, ] <- rnorm(n)
    }
  if (inds[j] == 2){
    X[j, ] <- rnorm(n, sd = 2)
  }
  if (inds[j] == 3){
    X[j, ] <- rnorm(n, mean = 1)
  }
  if (inds[j] == 4){
    X[j, ] <- rnorm(n, mean = 1, sd = 2)
  }
 }
rho <-  0.1
ind <- sample(1:p, rho * p)
li <- length(ind)
indsy <- inds
for (l in 1:li){
  if (indsy[ind[l]]==1){
     indsy[ind[l]]=3
     } else {
       if (indsy[ind[l]]==2){
          indsy[ind[l]]=4
           } else {
            if (indsy[ind[l]]==3){
               indsy[ind[l]]=1
               } else {
                indsy[ind[l]] = 2
                }
               }
             }
           }
Y <- matrix(rep(0, m * p), ncol = m)
for (j in 1:p){
  if (indsy[j] == 1){
    Y[j,] <- rnorm(m)}
  if (indsy[j] == 2){
    Y[j, ] <- rnorm(m, sd = 2)
  }
  if (indsy[j]==3){
    Y[j, ] <- rnorm(m, mean = 1)
  }
  if (indsy[j] == 4){
    Y[j,] <- rnorm(m, mean = 1, sd = 2)
  }
 }

# Our interest is to test the null hypothesis that the distribution of each of the 1000 variables
# is the same in the two groups.

# We use for this purpose the four methods proposed in Cousido-Rocha et al. (2018).

res1 <- TwoSampleTest.HD(X, Y, method = "spect")
res1
res2 <- TwoSampleTest.HD(X, Y, method = "boot")
res2
res3 <- TwoSampleTest.HD(X, Y, method = "us")
res3
res4 <- TwoSampleTest.HD(X, Y, method = "perm")
res4
# The four methods reject the global null hypothesis.
# Hence, we use the individual permutation p-values
# to identify which variables are not equally distributed in the two groups.
pv<-res4$I.permutation.p.values

# Applying a multiple testing procedure to these p-values
# we can detect the variables with different distributions for the two groups.
# The following plot of the individual permutation p-values is also informative.
# We remark in red the 100 smallest p-values.

pv_sort <- sort(pv)
cri <- pv_sort[100]
ind <- which(pv <= cri)
plot(1:p, pv, main = "Individual permutation p-values",
     xlab = "Variables", ylab = "p-values")
points(ind, pv[ind], col = "red")
## End(No test)



