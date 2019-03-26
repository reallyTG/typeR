library(copula)


### Name: qqplot2
### Title: Q-Q Plot with Rugs and Pointwise Asymptotic Confidence Intervals
### Aliases: qqplot2
### Keywords: hplot

### ** Examples

n <- 250
df <- 7
set.seed(1)
x <- rchisq(n, df=df)

## Q-Q plot against the true quantiles (of a chi^2_3 distribution)
qqplot2(x, qF = function(p) qchisq(p, df=df),
        main = substitute(bold(italic(chi[NU])~~"Q-Q Plot"), list(NU=df)))

## in log-log scale
qqplot2(x, qF = function(p) qchisq(p, df=df), log="xy",
        main = substitute(bold(italic(chi[NU])~~"Q-Q Plot"), list(NU=df)))

## Q-Q plot against wrong quantiles (of an Exp(1) distribution)
qqplot2(x, qF=qexp, main = quote(bold(Exp(1)~~"Q-Q Plot")))



