library(mefa)


### Name: aggregate.mefa
### Title: Extract and Aggregate Objects of Class 'mefa'
### Aliases: aggregate.mefa [.mefa xtab samp taxa segm
### Keywords: manip methods

### ** Examples

data(dol.count, dol.samp, dol.taxa)
x <- mefa(stcs(dol.count), dol.samp, dol.taxa)
## These two are identical
aggregate(x, "microhab")
aggregate(x, x$samp$microhab, inside = FALSE)
## Interaction
aggregate(x, c("method", "microhab"))
## Both samples and taxa tables
aggregate(x, "microhab", "familia")
## To use a factor
aggregate(x, "microhab", as.factor(rbinom(dim(x)[2], 1, 0.5)))
## Extraction
x[1:10, ]
x[, 1:5]
x[, , "broken"]
x[1:10, 1:5]
x[1:10, 1:5, 2]
## Note factor levels
y <- x[which(x$samp$method == "time"), ]
levels(y$samp$method)
z <- x[which(x$samp$method == "time"), drop = TRUE]
levels(z$samp$method)
## Note the differences in total sums
y <- mefa(stcs(dol.count), dol.samp, dol.taxa, nested = TRUE)
x[ , , 2]
y[ , , 2]



