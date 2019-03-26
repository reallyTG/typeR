library(subtee)


### Name: subbuild
### Title: Generating candidate subgroups based on an input data set
### Aliases: subbuild

### ** Examples

data(datnorm)
## data frame of covariates considered for subgroup analysis
cov.dat <- datnorm[,c("height", "labvalue", "region", "smoker")]
## by default generate all subgroups for each categorical variable and
## use cut-offs based on quantiles for numeric variables
cand.groups <- subbuild(cov.dat)
head(cand.groups)
## alternatively use
cand.groups <- subbuild(datnorm, height, labvalue, region, smoker)
head(cand.groups)

## use more cutpoints
cand.groups2 <- subbuild(cov.dat, n.cuts = 4)
ncol(cand.groups)
ncol(cand.groups2)

## remove duplicate columns for smoker
cand.groups3 <- subbuild(cov.dat, dupl.rm = TRUE)
head(cand.groups3)
ncol(cand.groups3)

## syntactically valid names
cand.groups4 <- subbuild(cov.dat, make.valid.names = TRUE)
head(cand.groups4)

## manually specify subgroup definitions and which covariates to consider
cand.groups5 <- subbuild(cov.dat, region == "EU", height > 172, labvalue)
## note that for labvalue cut-offs are generated automatically based on quantiles
head(cand.groups5)

## further examples for manual specification of subgroups
cand.groups6 <- subbuild(cov.dat, region %in% c("Japan","EU"), smoker != 0)
## note that for labvalue cut-offs are generated automatically based on quantiles
head(cand.groups6)

## missing values in data-set are propagated through
cov.dat$labvalue[sample(1:nrow(cov.dat),10)] <- NA
cov.dat$region[sample(1:nrow(cov.dat),20)] <- NA
cov.dat$smoker[sample(1:nrow(cov.dat),10)] <- NA
cand.groups7 <- subbuild(cov.dat)
head(cand.groups7)

## if covariates in the data frame contain missing values consider
## imputing them for example with the rfImpute function from the
## randomForest package



