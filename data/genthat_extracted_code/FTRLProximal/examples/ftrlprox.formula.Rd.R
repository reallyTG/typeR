library(FTRLProximal)


### Name: ftrlprox.formula
### Title: FTRL Proximal formula
### Aliases: ftrlprox.formula

### ** Examples

require(mlbench)

p <- mlbench.circle(100,2)
dat <- as.data.frame(p)

mdl <- ftrlprox(classes ~ x.1 + x.2 + I(x.1^2) + I(x.2^2), dat,
                a = 0.3, lambda = 5.0, alpha = 1.0)
print(mdl)



