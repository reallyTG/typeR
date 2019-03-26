library(smaa)


### Name: smaa.pwi
### Title: SMAA pair-wise winning indices
### Aliases: smaa.pwi

### ** Examples

N <- 1E4; m <- 2; n <- 3
meas <- dget(system.file("extdata/thrombo-meas.txt.gz", package="smaa"))
pref <- dget(system.file("extdata/thrombo-weights-nopref.txt.gz", package="smaa"))

# Calculate pair-wise winning indices
values <- smaa.values(meas, pref)
ranks <- smaa.ranks(values)
pwi <- smaa.pwi(ranks)
print(pwi)



