library(revealedPrefs)


### Name: simPrefs
### Title: Generate random data according to a given matrix of direct
###   preferences.
### Aliases: simPrefs

### ** Examples

# Generate 3 observations of 5 goods, according to a given preference matrix
pref.mat <- matrix(c(1,0,0,2,1,0,2,2,1), 3)
simdata <- simPrefs(pref.mat = pref.mat, ngoods = 5)



