library(RInSp)


### Name: import.RInSp
### Title: Import data into a RInSp object
### Aliases: import.RInSp
### Keywords: function utilities

### ** Examples


data(Stickleback)
# Import data
GutContents = import.RInSp(Stickleback,  row.names = 1, info.cols = c(2:13))
GutContents
# Select a single spatial sampling site (site A)
GutContents_SiteA = import.RInSp(Stickleback, row.names = 1, info.cols = c(2:13),
subset.rows = c("Site", "A"))

# Select a subset of prey types
GutContents_subset = import.RInSp(Stickleback, row.names = 1, info.cols = c(2:13),
subset.column = c(13:28, 45))

# Lump prey types into functional groups then import data
# define new columns representing lumped prey categories
attach(Stickleback)
Copepods <- Calanoid + Cyclopoid + Harpacticoid
Diptera <- Diptera.Pupae + Chironomid.larvae + Ceratopogonid.larvae + Tipulid.larvae +
Tipulidae.Adult + Diptera.Adult + Diptera.Larvae + Ceratopogonid.Adult
InsectLarvae <- Ephemeroptera + Trichoptera.larvae + Ephemeroptera.pupae +
Zygoptera.larvae + Plecoptera.larvae
Cladocera <- Bosmina + Polyphemus + Holopedium + Daphnia + Chydorus
names(Stickleback)
GutContents_lumped <- import.RInSp(Stickleback, row.names = 1, info.cols = c(2:13),
subset.column = c(18,24,28,31,43:46))
rm(list=ls(all=TRUE))



