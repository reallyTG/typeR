library(SkewHyperbolic)


### Name: summary.skewhypFit
### Title: Summarising the Skew Hyperbolic Student t-Distribution Fit
### Aliases: summary.skewhypFit print.summary.skewhypFit
### Keywords: distribution

### ** Examples

## Continuing the skewhypFit(.) example:
data(lrdji)
djfit <- skewhypFit(lrdji, print = FALSE, plot = FALSE, hessian = TRUE)
print(djfit)
summary(djfit)



