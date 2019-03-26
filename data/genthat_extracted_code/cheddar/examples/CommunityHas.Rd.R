library(cheddar)


### Name: Community has property?
### Title: Community has property?
### Aliases: HasM HasN HasTrophicLinks
### Keywords: utilities

### ** Examples

# Tuesday Lake 1984 has all three
data(TL84)
HasM(TL84)
HasN(TL84)
HasTrophicLinks(TL84)

# Skipwith Pond has trophic links but not M or N
data(SkipwithPond)
HasM(SkipwithPond)
HasN(SkipwithPond)
HasTrophicLinks(SkipwithPond)



