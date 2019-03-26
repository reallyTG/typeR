library(mefa)


### Name: mefa
### Title: Create an Object of Class 'mefa'
### Aliases: mefa-package mefa is.mefa print.mefa summary.mefa
###   print.summary.mefa dim.mefa dimnames.mefa
### Keywords: classes manip methods

### ** Examples

data(dol.count, dol.samp, dol.taxa)
## Input is stcs
x1 <- mefa(stcs(dol.count))
x1
## Input is matrix
x2 <- mefa(x1$xtab)
x2
## Attach data frame for samples
x3 <- mefa(stcs(dol.count), dol.samp)
x3
## Attach data frame for samples and taxa
x4 <- mefa(stcs(dol.count), dol.samp, dol.taxa)
x4
## Methods
## (chapter 'See also' provides
## links for further methods)
summary(x4)
## Descriptives inside the summary
unclass(summary(x4))
## Testing mefa objects
is(x4, "mefa")
## Removing empty samples
as.mefa(x4, drop.zero = TRUE)
## Dimensions
dim(x4)
## Dimnames
dimnames(x4)
## Simple examples how to use mefa objects in analyis
## GLM on sample abundances
mod <- glm(summary(x4)$s.abu ~ .^2,
    data = x4$samp, family = quasipoisson)
summary(mod)
## See the demo and vignette for more examples
# demo(mefa)
# vignette("mefa")
## Cluster analysis of community matrix
x5 <- aggregate(x4, c("method", "microhab"))
h <- hclust(dist(x5$xtab))
plot(h)



