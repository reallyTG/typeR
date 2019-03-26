library(biostat3)


### Name: lifetab2
### Title: Formula wrapper for 'lifetab' from the 'KMsurv' package.
### Aliases: lifetab2
### Keywords: survival

### ** Examples

## we can use unique transformed times (colon_sample)
lifetab2(Surv(floor(surv_yy),status=="Dead: cancer")~1, colon_sample)

## we can also use the breaks argument (colon)
lifetab2(Surv(surv_yy,status=="Dead: cancer")~1, colon, breaks=0:10)



