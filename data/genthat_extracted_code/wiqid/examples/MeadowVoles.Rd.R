library(wiqid)


### Name: MeadowVoles
### Title: Robust design mark-recapture data for meadow voles
### Aliases: MeadowVoles
### Keywords: datasets

### ** Examples

data(MeadowVoles)

# Extract detection histories:
DH <- MeadowVoles[, 1:30]
freq <- MeadowVoles$freq

survRD(DH, freq=freq, occsPerSeason=5)




