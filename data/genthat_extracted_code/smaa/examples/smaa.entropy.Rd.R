library(smaa)


### Name: smaa.entropy
### Title: Decision entropy
### Aliases: smaa.entropy smaa.entropy.ranking smaa.entropy.choice

### ** Examples

N <- 1E4; m <- 2; n <- 3
meas <- dget(system.file("extdata/thrombo-meas.txt.gz", package="smaa"))
pref <- dget(system.file("extdata/thrombo-weights-nopref.txt.gz", package="smaa"))

# Calculate ranks
values <- smaa.values(meas, pref)
ranks <- smaa.ranks(values)

# Calculate ranking entropy
smaa.entropy.ranking(ranks)

# Calculate choice entropy
# (equal to ranking entropy because there are only two alternatives)
smaa.entropy.choice(ranks)
smaa.entropy.choice(smaa.ra(ranks))



