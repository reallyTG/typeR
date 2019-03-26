library(cheddar)


### Name: RemoveCannibalisticLinks
### Title: Remove cannibalistic trophic links
### Aliases: RemoveCannibalisticLinks
### Keywords: utilities

### ** Examples

data(TL84)
NumberOfTrophicLinks(TL84)

TL84.no.cannibal <- RemoveCannibalisticLinks(TL84)
NumberOfTrophicLinks(TL84.no.cannibal)



