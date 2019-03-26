library(smaa)


### Name: smaa.ranks
### Title: SMAA ranking
### Aliases: smaa.ranks

### ** Examples

N <- 1E4; m <- 2; n <- 3
meas <- dget(system.file("extdata/thrombo-meas.txt.gz", package="smaa"))
pref <- dget(system.file("extdata/thrombo-weights-nopref.txt.gz", package="smaa"))

# Calculate alternative ranks
values <- smaa.values(meas, pref)
ranks <- smaa.ranks(values)
summary(ranks)

ranks.expected <- dget(system.file("extdata/thrombo-ranks-nopref.txt.gz", package="smaa"))
stopifnot(all.equal(ranks, ranks.expected))



