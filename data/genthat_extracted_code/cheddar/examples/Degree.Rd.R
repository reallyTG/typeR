library(cheddar)


### Name: Degree
### Title: Node degree
### Aliases: Degree InDegree OutDegree TrophicGenerality
###   TrophicVulnerability NumberOfResources NumberOfConsumers
###   NormalisedTrophicGenerality NormalisedTrophicVulnerability
### Keywords: utilities

### ** Examples

data(TL84)

d <- Degree(TL84)
i <- InDegree(TL84)
o <- OutDegree(TL84)

# This equality is always TRUE for all food webs
all(d == i+o)

ntg <- NormalisedTrophicGenerality(TL84)
mean(ntg)    # Equals 1
ntv <- NormalisedTrophicVulnerability(TL84)
mean(ntv)    # Equals 1



