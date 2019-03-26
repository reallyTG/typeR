library(Hmisc)


### Name: t.test.cluster
### Title: t-test for Clustered Data
### Aliases: t.test.cluster print.t.test.cluster
### Keywords: htest

### ** Examples

set.seed(1)
y <- rnorm(800)
group <- sample(1:2, 800, TRUE)
cluster <- sample(1:40, 800, TRUE)
table(cluster,group)
t.test(y ~ group)   # R only
t.test.cluster(y, cluster, group)
# Note: negate estimates of differences from t.test to
# compare with t.test.cluster



