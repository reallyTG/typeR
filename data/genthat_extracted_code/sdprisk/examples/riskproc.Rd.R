library(sdprisk)


### Name: riskproc
### Title: Compound Poisson Risk Process with Diffusion
### Aliases: riskproc is.riskproc
### Keywords: models utilities

### ** Examples

## A risk process with hypo-exponentially distributed individual claim amounts
riskproc(
    claims   = claiminfo(hypoexp = list(rates = c(1, 10))),
    premium  = 2,
    freq     = 1,
    variance = 0.4
)



