library(smaa)


### Name: smaa.ra
### Title: SMAA rank acceptabilities
### Aliases: smaa.ra

### ** Examples

N <- 1E4; m <- 2; n <- 3
meas <- dget(system.file("extdata/thrombo-meas.txt.gz", package="smaa"))
pref <- dget(system.file("extdata/thrombo-weights-nopref.txt.gz", package="smaa"))

# Calculate rank acceptabilities
values <- smaa.values(meas, pref)
ranks <- smaa.ranks(values)
ra <- smaa.ra(ranks)
print(ra)
plot(ra)



