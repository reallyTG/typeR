library(MSnbase)


### Name: combineFeatures
### Title: Combines features in an 'MSnSet' object
### Aliases: combineFeatures

### ** Examples

data(msnset)
msnset <- msnset[11:15, ]
exprs(msnset)

## arbitrary grouping into two groups
grp <- as.factor(c(1, 1, 2, 2, 2))
msnset.comb <- combineFeatures(msnset, grp, "sum")
dim(msnset.comb)
exprs(msnset.comb)
fvarLabels(msnset.comb)

## grouping with a list
grpl <- list(c("A", "B"), "A", "A", "C", c("C", "B"))
## optional naming
names(grpl) <- featureNames(msnset)
exprs(combineFeatures(msnset, grpl, fun = "sum", redundancy.handler = "unique"))
exprs(combineFeatures(msnset, grpl, fun = "sum", redundancy.handler = "multiple"))

## missing data
exprs(msnset)[4, 4] <-
    exprs(msnset)[2, 2] <- NA
exprs(msnset)
## NAs propagate in the 115 and 117 channels
exprs(combineFeatures(msnset, grp, "sum"))
## NAs are removed before summing
exprs(combineFeatures(msnset, grp, "sum", na.rm = TRUE))

## using iPQF
data(msnset2)
anyNA(msnset2)
res <- combineFeatures(msnset2,
		       groupBy = fData(msnset2)$accession,
		       redundancy.handler = "unique",
		       fun = "iPQF",
		       low.support.filter = FALSE,
		       ratio.calc = "sum",
		       method.combine = FALSE)
head(exprs(res))

## using robust summarisation
data(msnset) ## reset data
msnset <- log(msnset, 2) ## log2 transform

## Feature X46, in the ENO protein has one missig value
which(is.na(msnset), arr.ind = dim(msnset))
exprs(msnset["X46", ])
## Only the missing value in X46 and iTRAQ4.116 will be ignored
res <- combineFeatures(msnset,
		       fcol = "ProteinAccession",
		       fun = "robust")
tail(exprs(res))

msnset2 <- filterNA(msnset) ## remove features with missing value(s)
res2 <- combineFeatures(msnset2,
			fcol = "ProteinAccession",
			fun = "robust")
## Here, the values for ENO are different because the whole feature
## X46 that contained the missing value was removed prior to fitting.
tail(exprs(res2))



