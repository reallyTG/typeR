library(sdprisk)


### Name: adjcoef
### Title: Adjustment Coefficient
### Aliases: adjcoef
### Keywords: utilities

### ** Examples

## Setting up a risk process with hypo-exponentially distributed claims
myprocess <- riskproc(
    claims   = claiminfo(hypoexp = list(rates = c(1, 10))),
    premium  = 2,
    freq     = 1,
    variance = 0.4
)

## Return the adjustment coefficient
adjcoef(myprocess)



