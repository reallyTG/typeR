library(smaa)


### Name: smaa.cf
### Title: SMAA confidence factors
### Aliases: smaa.cf

### ** Examples

N <- 1E4; m <- 2; n <- 3
meas <- dget(system.file("extdata/thrombo-meas.txt.gz", package="smaa"))
pref <- dget(system.file("extdata/thrombo-weights-nopref.txt.gz", package="smaa"))

# Calculate central weights
values <- smaa.values(meas, pref)
ranks <- smaa.ranks(values)
cw <- smaa.cw(ranks, pref)
print(cw)
cf <- smaa.cf(meas, cw)
print(cf)
plot(cf)



