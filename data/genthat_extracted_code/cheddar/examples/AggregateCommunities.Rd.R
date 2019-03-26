library(cheddar)


### Name: AggregateCommunities
### Title: Aggregate communities
### Aliases: AggregateCommunities AggregateCommunitiesBy
### Keywords: utilities

### ** Examples

data(pHWebs)

# An aggregate of 3 communities
AggregateCommunities(pHWebs, c('Old Lodge', 'Afon Hafren', 'Broadstone'))

# The Duddon Pike Beck and Mosedal Beck communities share the same 
# latitude and have pH values of 6.1 and 5.9 respectively.
CollectionCPS(pHWebs[c('Duddon Pike Beck', 'Mosedal Beck')])

# Aggregating by the 'lat' property therefore results in a new collection 
# of nine communities.
CollectionCPS(AggregateCommunitiesBy(pHWebs, 'lat'))

# Would produce an error
## Not run: AggregateCommunities(pHWebs, c('not a community', 'Afon Hafren'))



