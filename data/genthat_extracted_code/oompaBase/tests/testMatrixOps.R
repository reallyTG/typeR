library(oompaBase)
# a key point is to test the matrixPairedT code
# we create a simple example
set.seed(372284)
nPairs <- 3
nGenes <- 7
m <- matrix(rnorm(2*nPairs*nGenes), ncol=2*nPairs)
v <- factor(rep(c("A","B"), each=nPairs))
pf <- rep(1:nPairs, 2)
colnames(m) <- paste(as.character(v), pf, sep='')
round(m, 2)
# Now we run the package code
mpt <- matrixPairedT(m, v, pf)
# We also loop over the standard t.test function
# for each gene
realt <- sapply(1:nGenes, function(i) {
  x <- m[i, v=="A"]
  y <- m[i, v=="B"]
  t1 <- t.test(y, x, paired=TRUE)
  t1$statistic
})
# The differences should all be less than 1e-15
all(round(mpt-realt, 15) == 0)

# for completeness, we also check the unpaired result

mtt <- matrixT(m, v)
realt <- sapply(1:nGenes, function(i) {
  x <- m[i, v=="A"]
  y <- m[i, v=="B"]
  t1 <- t.test(x, y, paired=FALSE, var.equal=TRUE)
  t1$statistic
})
# The differences should all be less than 1e-15
all(round(mtt-realt, 15) == 0)

# and the unequal variance case
mut <- matrixUnequalT(m,v)
realt <- sapply(1:nGenes, function(i) {
  x <- m[i, v=="A"]
  y <- m[i, v=="B"]
  t1 <- t.test(x, y, paired=FALSE, var.equal=FALSE)
  t1$statistic
})
# The differences should all be less than 1e-15
all(round(mut$tt-realt, 15) == 0)
