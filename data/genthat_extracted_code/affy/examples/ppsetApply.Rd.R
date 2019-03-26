library(affy)


### Name: ppsetApply
### Title: Apply a function over the ProbeSets in an AffyBatch
### Aliases: ppsetApply ppset.ttest
### Keywords: manip

### ** Examples

ppset.ttest <- function(ppset, covariate, pmcorrect.fun = pmcorrect.pmonly, ...) {
  probes <- do.call("pmcorrect.fun", list(ppset))
  my.ttest <- function(x) {
    y <- split(x, get(covariate))
    t.test(y[[1]], y[[2]])$p.value
  }
  r <- apply(probes, 1, my.ttest)
  return(r)
}
##this takes a long time - and rowttests is a good alternative
## eg: rt = rowttests(exprs(Dilution), Dilution$liver)
## Not run: 
##D   data(Dilution)
##D   all.ttest <- ppsetApply(Dilution, ppset.ttest, covariate="liver")
## End(Not run)



