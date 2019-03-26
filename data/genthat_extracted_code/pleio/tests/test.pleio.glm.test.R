## simulations to demo pleiotropy.glm

## needed for pleiotropy.glm.fit (for ordinal regression). Should this be
## moved to pleitropy.glm.fit?

#library(rms)
devel=FALSE
if(devel) {
  load("~/Projects/Pleiotropy/Build/pleioV2/data/pleio.demo.RData")
  library(rms)
  rf <- list.files("../R", pattern="*.R", full.names=TRUE, include.dirs=TRUE)
  for(fi in rf) source(fi)
  
} else {
  require(pleio)
  data("pleio.demo")
}

## test without covars
fams <- c("gaussian","binomial","ordinal")
obj <- pleio.glm.fit(y, geno, glm.family=fams)
stat <- pleio.glm.test(obj, count.nonzero.coef = 0)
stat$stat
stat$pval
pleio.glm.sequential(obj, pval.threshold=.5)

## test with covars

## save these as .RData objects for updated package

## length of index.cov must be the number of traits,
## no. cols of y

#index.cov  <- vector(mode="list", length=3)
index.cov <- list()
## cols 1 and 2 are covariates for trait 1, etc.
index.cov[[1]] <- c(1:2)
index.cov[[2]] <- c(2:4)
index.cov[[3]] <- c(4,5)

obj <- pleio.glm.fit(y, geno, glm.family=fams, x.all=x, x.index.list=index.cov)
stat <- pleio.glm.test(obj, count.nonzero.coef = 0)
stat$stat
stat$pval

plseq <- pleio.glm.sequential(obj, pval.threshold=.52)
print(plseq)

## test with other numbers of covariates
## if no covariates for one of the traits, breaks
index.cov[[1]] <- 1:2
index.cov[[2]] <- 2:4
index.cov[[3]] <- 0
## index.cov[[3]] <- c(3,4)
## Used to get an error, now works
obj <- pleio.glm.fit(y, geno, glm.family=fams, x.all=x, x.index.list=index.cov)
stat <- pleio.glm.test(obj, count.nonzero.coef = 0)
stat$stat
stat$pval

plseq <- pleio.glm.sequential(obj, pval.threshold=.55)
print(plseq)

## should return all NA results
gmono <- rep(1, nrow(y))
obj <- pleio.glm.fit(y, gmono, glm.family=fams, x.all=x, x.index.list=index.cov)
stat <- pleio.glm.test(obj, count.nonzero.coef = 0)
stat$stat
stat$pval

plseq <- pleio.glm.sequential(obj, pval.threshold=.6)
print(plseq)


## used to give an error passing data.frame , but fixed to allow matrix and df 10/1/18
xdf <- as.data.frame(x)
ydf <- as.data.frame(y)
objdf <- pleio.glm.fit(ydf, geno, glm.family=fams, x.all=xdf, x.index.list=index.cov)

plseq <- pleio.glm.sequential(objdf, pval.threshold=.55)
print(plseq)
