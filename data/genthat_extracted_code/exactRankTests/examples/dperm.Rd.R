library(exactRankTests)


### Name: dperm
### Title: Distribution of One and Two Sample Permutation Tests
### Aliases: dperm pperm qperm rperm
### Keywords: distribution

### ** Examples


# exact one-sided p-value of the Wilcoxon test for a tied sample

x <- c(0.5, 0.5, 0.6, 0.6, 0.7, 0.8, 0.9)
y <- c(0.5, 1.0, 1.2, 1.2, 1.4, 1.5, 1.9, 2.0)
r <- cscores(c(x,y), type="Wilcoxon")
pperm(sum(r[seq(along=x)]), r, 7)

# Compare the exact algorithm as implemented in ctest and the
# Shift-Algorithm by Streitberg & Roehmel for untied samples
 
# Wilcoxon:

n <- 10
x <- rnorm(n, 2)
y <- rnorm(n, 3)
r <- cscores(c(x,y), type="Wilcoxon")

# exact distribution using the Shift-Algorithm

dwexac <- dperm((n*(n+1)/2):(n^2 + n*(n+1)/2), r, n)
sum(dwexac)           # should be something near 1 :-)

# exact distribution using dwilcox

dw <- dwilcox(0:(n^2), n, n)

# compare the two distributions:

plot(dw, dwexac, main="Wilcoxon", xlab="dwilcox", ylab="dperm")      
# should give a "perfect" line

# Wilcoxon signed rank test

n <- 10
x <- rnorm(n, 5)
y <- rnorm(n, 5)
r <- cscores(abs(x - y), type="Wilcoxon")
pperm(sum(r[x - y > 0]), r, length(r))
wilcox.test(x,y, paired=TRUE, alternative="less")
psignrank(sum(r[x - y > 0]), length(r))

# Ansari-Bradley

n <- 10
x <- rnorm(n, 2, 1)
y <- rnorm(n, 2, 2)

# exact distribution using the Shift-Algorithm

sc <- cscores(c(x,y), type="Ansari")
dabexac <- dperm(0:(n*(2*n+1)/2), sc, n)
sum(dabexac)

# real scores are allowed (but only result in an approximation)
# e.g. v.d. Waerden test

n <- 10
x <- rnorm(n)
y <- rnorm(n)
scores <- cscores(c(x,y), type="NormalQuantile")
X <- sum(scores[seq(along=x)])  # <- v.d. Waerden normal quantile statistic

# critical value, two-sided test

abs(qperm(0.025, scores, length(x)))

# p-values

p1 <- pperm(X, scores, length(x), alternative="two.sided")

# generate integer valued scores with the same shape as normal quantile
# scores, this no longer v.d.Waerden, but something very similar

scores <- cscores(c(x,y), type="NormalQuantile", int=TRUE)

X <- sum(scores[seq(along=x)])
p2 <- pperm(X, scores, length(x), alternative="two.sided")

# compare p1 and p2

p1 - p2




