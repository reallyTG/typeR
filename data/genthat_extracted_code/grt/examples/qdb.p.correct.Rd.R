library(grt)


### Name: qdb.p.correct
### Title: the proportion correct of the quadratic decision boundary.
### Aliases: qdb.p.correct
### Keywords: multivariate

### ** Examples

data(subjdemo_2d)
tmp <- split(subjdemo_2d, subjdemo_2d$category)
mc <- mcovs(category ~ x + y, data=subjdemo_2d, pooled=FALSE)
db <- qdb(mc$means, mc$covs)
qdb.p.correct(tmp[[1]][,2:3], db)



