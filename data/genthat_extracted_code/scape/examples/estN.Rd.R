library(scape)


### Name: estN
### Title: Estimate Effective Sample Size
### Aliases: estN estN.int

### ** Examples

## Exploring candidate sample sizes:

getN(x.sbw)     # sample sizes used in assessment: number of tows
estN(x.sbw)     # effective sample size, given data (tows) and model fit
estN(x.sbw, ceiling=200)  # could use this
estN(x.sbw, init=FALSE)   # from model fit, disregarding tows
plotCA(x.sbw)             # years with good fit => large sample size
estN(x.sbw, init=1)       # one sample size across all years
estN(x.sbw, init=c(rep(1,14),rep(2,9)))  # two sampling periods

## Same mean, regardless of init:

mean(estN(x.sbw, digits=NULL))
mean(estN(x.sbw, digits=NULL, init=FALSE))
mean(estN(x.sbw, digits=NULL, init=1))
mean(estN(x.sbw, digits=NULL, init=c(rep(1,14),rep(2,9))))

## Same median, regardless of init:

median(estN(x.sbw, FUN=median, digits=NULL))
median(estN(x.sbw, FUN=median, digits=NULL, init=FALSE))
median(estN(x.sbw, FUN=median, digits=NULL, init=1))
median(estN(x.sbw, FUN=median, digits=NULL, init=c(rep(1,14),rep(2,9))))

## Multiple series:

getN(x.ling, "CLc")              # sample size used in assessment
getN(x.ling, "CLc", digits=0)    # rounded
estN(x.ling, "CLc")              # model fit implies larger sample sizes

getN(x.ling, "CLc", series="1", digits=0)  # get one series
estN(x.ling, "CLc", series="1")            # estimate one series



