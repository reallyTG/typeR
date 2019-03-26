library(cheddar)


### Name: subset.CommunityCollection
### Title: A subset of a collection of communities
### Aliases: subset.CommunityCollection
### Keywords: utilities

### ** Examples

data(pHWebs)

# Two communities have pH>7
subset(pHWebs, pH>7)

# No communities have pH>10 so this returns NULL
subset(pHWebs, pH>7)

# Get a subset based on a computed property
subset(pHWebs, S>50, properties=c(S='NumberOfNodes'))

# X is not a property so this raises an error
## Not run: subset(pHWebs, X==1)



