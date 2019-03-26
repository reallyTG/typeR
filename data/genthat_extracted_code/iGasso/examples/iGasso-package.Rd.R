library(iGasso)


### Name: iGasso-package
### Title: Statistical Tests and utilities for Genetic Association
### Aliases: iGasso-package iGasso

### ** Examples

y = rnorm(100)
chr = c(rep(1, 20), rep(3, 20), rep(10, 20), rep(19, 30), rep("X", 10))
pos = c(1:20, 1:20, 1:20, 1:30, 1:10)
mydata = data.frame(y=y, chr=chr, pos=pos)
genome.plot(mydata, sig.line=c(1, -1), ylab="T Statistic")

G = rbind(c(14, 999), c(3, 1081))
VSTF.test(G)

G = rbind(c(161, 474, 489), c(231, 444, 380))
MFree.test(G)

G = matrix(sample(c(0,1,2), 200, replace=TRUE), ncol=10)
y = rnorm(10)
X = matrix(rnorm(10), ncol=1)



