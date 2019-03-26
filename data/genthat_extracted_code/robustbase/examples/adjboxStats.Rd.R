library(robustbase)


### Name: adjboxStats
### Title: Statistics for Skewness-adjusted Boxplots
### Aliases: adjboxStats
### Keywords: robust univar

### ** Examples

data(condroz)
adjboxStats(ccA <- condroz[,"Ca"])
adjboxStats(ccA, doReflect = TRUE)# small difference in fence

## Test reflection invariance [was not ok, up to and including robustbase_0.7-8]
a1 <- adjboxStats( ccA, doReflect = TRUE)
a2 <- adjboxStats(-ccA, doReflect = TRUE)

nm1 <- c("stats", "conf", "fence")
stopifnot(all.equal(       a1[nm1],
                    lapply(a2[nm1], function(u) rev(-u))),
          all.equal(a1[["out"]], -a2[["out"]]))



