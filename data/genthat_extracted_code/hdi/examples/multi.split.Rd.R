library(hdi)


### Name: multi.split
### Title: Calculate P-values Based on Multi-Splitting Approach
### Aliases: multi.split
### Keywords: models regression

### ** Examples

n <-  40 # a bit small, to keep example "fast"
p <- 256
x <- matrix(rnorm(n*p), nrow = n, ncol = p)
y <- x[,1] * 2 + x[,2] * 2.5 + rnorm(n)

## Multi-splitting with lasso.firstq as model selector function
## 'q' must be specified
fit.multi <- multi.split(x, y, model.selector = lasso.firstq,
                         args.model.selector = list(q = 10))
fit.multi
head(fit.multi$pval.corr, 10) ## the first 10 p-values
ci. <- confint(fit.multi)
head(ci.) # the first 6
stopifnot(all.equal(ci.,
     with(fit.multi, cbind(lci, uci)), check.attributes=FALSE))

## No test: 
## Use default 'lasso.cv' (slower!!) -- incl cluster group testing:
system.time(fit.m2 <- multi.split(x, y, return.selmodels = TRUE))# 9 sec (on "i7")
head(fit.m2$pval.corr) ## the first  6  p-values
head(confint(fit.m2))  ## the first  6  95% conf.intervals

## Now do clustergroup testing
clGTst <- fit.m2$clusterGroupTest
names(envGT <- environment(clGTst))# about 14
if(!interactive()) # if you are curious (and advanced):
  print(ls.str(envGT), max = 0)
stopifnot(identical(clGTst, envGT$clusterGroupTest))
ccc <- clGTst()
str(ccc)
ccc$hh   # the clustering
has.1.or.2 <- sapply(ccc$clusters,
                function(j.set) any(c(1,2) %in% j.set))
ccc$pval[ has.1.or.2] ## all very small
ccc$pval[!has.1.or.2] ## all 1
## End(No test)



