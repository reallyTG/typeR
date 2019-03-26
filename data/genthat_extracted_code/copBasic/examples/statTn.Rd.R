library(copBasic)


### Name: statTn
### Title: The Tn Statistic of a Fitted Copula to an Empirical Copula
### Aliases: statTn
### Keywords: copula (goodness-of-fit) copula (inference) inference
###   goodness-of-fit

### ** Examples

## Not run: 
##D # Example here is just for Tn. For the example below, the PSP copula is radically
##D # different from the Gumbel-Hougaard copula and thus, the hatTn would be expected
##D # to be quite different from those of the Gumbel-Hougaard and certainly not too
##D # near to zero.
##D sampleUV  <- simCOP(n=60, cop=PSP, graphics=FALSE)   # random sample
##D hatTau <- cor(samUV$U, samUV$V, method="kendall") # Kendall Tau
##D hatTn  <- statTn(sampleUV, cop=GHcop, para=GHcop(tau=hatTau)$para,
##D                  ctype="bernstein", bernprogress=TRUE)
##D # approximate range 0.0141 -- 0.030
##D # hatTn in this case is by itself is somewhat uninformative and requires
##D # Monte Carlo to put an individual value into context.
## End(Not run)



