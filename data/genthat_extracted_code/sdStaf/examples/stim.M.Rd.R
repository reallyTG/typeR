library(sdStaf)


### Name: stim.M
### Title: Build buffer zone to M
### Aliases: stim.M

### ** Examples


# Phytotoma ocurrence data
data(phytotoma)

# Build buffer zone
buf_M <- stim.M(occs=phytotoma[,2:3], 100)

# Add points
points(phytotoma[,2:3])




