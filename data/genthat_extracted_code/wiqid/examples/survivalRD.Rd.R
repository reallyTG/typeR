library(wiqid)


### Name: Survival (RD)
### Title: Survival from mark-recapture data with robust design
### Aliases: survRD survRDah

### ** Examples


data(MeadowVoles)
# Extract detection histories:
DH <- MeadowVoles[, 1:30]
freq <- MeadowVoles$freq

# With single stage maximum likelihood estimation:
survRD(DH, freq=freq, occsPerSeason=5)

# The 2-stage approach:
# Stage 1 - using the jackknife estimator to estimate N and p for each season:
MhResult <- matrix(NA, 6, 2)
colnames(MhResult) <- c("N", "p")
seasonID <- rep(1:6, each=5)
for(i in 1:6) {
  dh <- DH[, seasonID==i]
  MhResult[i, ] <- closedCapMhJK(dh)$real[, 1]
}
MhResult
# Calculate the probability of being captured at least once in the season:
pStar <- 1 - (1 - MhResult[, "p"])^5

# Stage 2 - pass N and pStar to a modified CJS estimation routine:
survRDah(DH, freq=freq, occsPerSeason=5, N=MhResult[, "N"], pStar=pStar)




