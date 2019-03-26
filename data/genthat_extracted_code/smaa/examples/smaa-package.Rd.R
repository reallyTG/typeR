library(smaa)


### Name: smaa-package
### Title: SMAA: Stochastic Multi-criteria Acceptability Analysis
### Aliases: smaa-package

### ** Examples

N <- 1E4; m <- 2; n <- 3
meas <- dget(system.file("extdata/thrombo-meas.txt.gz", package="smaa"))
pref <- dget(system.file("extdata/thrombo-weights-nopref.txt.gz", package="smaa"))

# Calculate SMAA metrics (one-stage)
result <- smaa(meas, pref)
print(result)

# Calculate SMAA metrics (multi-stage)
values <- smaa.values(meas, pref)
summary(values)
ranks <- smaa.ranks(values)
smaa.ra(ranks)
smaa.entropy.ranking(ranks)
smaa.cw(ranks, pref)

# Calculate confidence factors
smaa.cf(meas, result$cw)



