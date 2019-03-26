library(Equalden.HD)


### Name: Equalden.test.HD
### Title: A test for the equality of a high dimensional set of densities
### Aliases: Equalden.test.HD

### ** Examples

## Don't show: 
n <- 2
k <- 100
set.seed(1234)
X <- matrix(rnorm(n * k), ncol = 2)
res <- Equalden.test.HD(X,  method = "indep")
res

### The statistic and the variance estimator
res$statistic
res$variance
## End(Don't show)
## No test: 
n <- 2
k <- 100
set.seed(1234)
X <- matrix(rnorm(n * k), ncol = 2)
res <- Equalden.test.HD(X,  method = "indep")

res
### The statistic and the variance estimator
res$statistic
res$variance
### The number of samples and sample size
res$k
res$n

### Real data analysis. We test the null hypothesis that 1000 randomly selected genes
### measured in patients with BRCA2 mutations have a common distribution. We use the test
### proposed in Cousido-Rocha et al. (2018) since correlation among expression levels of
### different genes on the same individual is expected.
data(Hedenfalk)
X <- Hedenfalk
k <- dim(X)[1]
### We eliminate the additive patients effects by substracting to each column its sample mean.
BRCA2 <- sweep(X[, 8:15], 2, apply(X[, 8:15], 2, mean))
set.seed (1234)
se<-1000
ind <- sample(1:k, se)
res1 <- Equalden.test.HD(BRCA2[ind, ], method = "dep.boot")
res1
res2 <- Equalden.test.HD(BRCA2[ind, ], method = "dep.spect")
res2
### The null hypothesis is rejected using both methods. Then we plot the individual statistics
### and highlight the 100 most extreme values.
cu <- 100
I.statistics.sorted <- sort(res1$I.statistics)
cv <- I.statistics.sorted[se-cu+1]
ind2 <- which(res1$I.statistics >= cv)
plot(1:se, res1$I.statistics, xlim = c(0, se), ylim = c(min(res1$I.statistics),
                                                        max(res1$I.statistics)),
     xlab = "Genes", ylab = "statistic", main = "Individual statistics")
points(ind2, res1$I.statistics[ind2], col = "red")
### We zoom the plot in the following way since some individual statistics report extreme
### negative values in this data.
plot(1:se, res1$I.statistics, xlim = c(0, se), ylim = c(0, max(res1$I.statistics)),
     xlab = "Genes", ylab = "statistic", main = "Individual statistics")
points(ind2, res1$I.statistics[ind2], col = "red")
## End(No test)



