library(scape)


### Name: getN
### Title: Extract Sample Size
### Aliases: getN

### ** Examples

## Exploring candidate sample sizes:

getN(x.sbw)  # sample sizes used in assessment: number of tows
estN(x.sbw)  # effective sample size, given data (tows) and model fit

## Multiple series:

getN(x.ling, "CLc")              # sample size used in assessment
getN(x.ling, "CLc", digits=0)    # rounded
estN(x.ling, "CLc")              # model fit implies larger sample sizes

getN(x.ling, "CLc", series="1", digits=0)  # get one series
estN(x.ling, "CLc", series="1")            # estimate one series



