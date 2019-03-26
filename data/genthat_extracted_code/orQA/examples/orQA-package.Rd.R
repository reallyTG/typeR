library(orQA)


### Name: orQA-package
### Title: Order restricted quality assessment of microarray titration data
### Aliases: orQA orQA-package
### Keywords: package

### ** Examples

## Let's assume a titration study with 10 genes 4 titration groups and
## 10 replicates which come from either of 2 biologically different
## samples (i.e. two times 4 technical replicates)

## WARNING: examples are run with a very limited number of permutations 

## Titration groups, random factor
g <- rep(1:4,each=8)
r <- rep(rep(1:2,each=4),4)

## No differences (global null)
nulldata <- matrix(rnorm(320),nc=32)
## Differences between titration levels in each gene
altdata <- t(t(nulldata)+g)

## Accuracy are there any significantly non monotonous trends

res <- pttest(nulldata,g,1000,r) # apply shape test

## no significant trends at all
sigdirPttest(res)

## with alternatives
res <- pttest(altdata,g,1000,r) # apply shape test


## some significant trends 
sigdirPttest(res)

## type of monotonicity (no significant trend, up, down,
##   "anti-monotonous")
table(monotonicity(res))

## Precision - estimate variance components

res <- est.lme(nulldata,g,r)
round(apply(res,2,summary),2)
res <- est.lme(altdata,g,r)
round(apply(res,2,summary),2)


## Trend test and agreement
## some other dataset with some alternatives in both directions
tdir <- sample((1:3)-2,10,rep=TRUE)
altdata2 <- matrix(rnorm(320),nc=32)+ (tdir %*% t(g))
res1 <- e2test(altdata,g,1000,r)
res2 <- e2test(altdata2,g,1000,r)

## trinomial coding for directions (-1 down, 0 non sig., 1 up)
sigdir1 <- sigdirE2test(res1)
sigdir2 <- sigdirE2test(res2)

## contingency table of directional decisions
table(sigdir1,sigdir2)




