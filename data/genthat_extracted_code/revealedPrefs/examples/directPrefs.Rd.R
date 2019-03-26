library(revealedPrefs)


### Name: directPrefs
### Title: Compute direct and indirect revealed preferences.
### Aliases: directPrefs indirectPrefs

### ** Examples

# Compute direct and indirect preferences of SARP-violating data:
data(noSarp)
directPrefs(noSarp$x, noSarp$p)
indirectPrefs(noSarp$x, noSarp$p)



