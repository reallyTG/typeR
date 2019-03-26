library(scape)


### Name: estSigmaR
### Title: Estimate Recruitment Sigma
### Aliases: estSigmaR

### ** Examples

getSigmaR(x.cod)  # sigmaR used in assessment 0.5 and 1.0
estSigmaR(x.cod)  # model estimates imply 0.20 and 0.52

getSigmaR(x.ling)  # 0.6, deterministic age distribution in first year
estSigmaR(x.ling)  # model estimates imply 0.36

getSigmaR(x.sbw)
estSigmaR(x.sbw)  # large deviates in first year
plotN(x.sbw)      # enormous plus group and 1991 cohort

# x.oreo assessment had deterministic recruitment, so no deviates



