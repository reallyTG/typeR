library(pleio)


### Name: pleio.q.sequential
### Title: Perform sequential tests of pleiotropy
### Aliases: pleio.q.sequential

### ** Examples

data(pleio.qdemo)
fit <- pleio.q.fit(y, geno)
test.seq <- pleio.q.sequential(fit, pval.threshold=.05)
test.seq



