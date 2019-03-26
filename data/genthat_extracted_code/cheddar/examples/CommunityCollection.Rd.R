library(cheddar)


### Name: CommunityCollection
### Title: Collections of communities
### Aliases: CommunityCollection is.CommunityCollection
###   plot.CommunityCollection print.CommunityCollection
###   summary.CommunityCollection $<-.CommunityCollection
###   [<-.CommunityCollection [[<-.CommunityCollection
###   dim<-.CommunityCollection length<-.CommunityCollection
###   levels<-.CommunityCollection names<-.CommunityCollection
###   [.CommunityCollection
### Keywords: utilities

### ** Examples

# 10 stream webs sampled over a wide pH gradient
data(pHWebs)
pHWebs


# Eyeball the webs
plot(pHWebs)

# Consistent axis limits
plot(pHWebs, xlim=c(-14,6), ylim=c(-3,13))

# Different plot function
plot(pHWebs, plot.fn=PlotWebByLevel, ylim=c(1,4.5))


# list-like operations
length(pHWebs)
sapply(pHWebs, 'NumberOfTrophicLinks')
pHWebs[['Broadstone']]  # Access the Community

# A new CommunityCollection containing every other ph web
pHWebs[seq(1, 10, by=2)]

# A new CommunityCollection containing two webs
pHWebs[c('Old Lodge','Bere Stream')]


# CollectionCPS gets community properties
CollectionCPS(pHWebs)   # Webs are sorted by increasing pH

# Order by decreasing pH
pHWebs.decreasing.pH <- OrderCollection(pHWebs, 'pH', decreasing=TRUE)
CollectionCPS(pHWebs.decreasing.pH)

# Order by name
pHWebs.name <- OrderCollection(pHWebs, 'title')
CollectionCPS(pHWebs.name, c('pH', 'NumberOfNodes'))

# The following will always be TRUE.
all(FALSE==duplicated(names(pHWebs)))


# A new collection of the two Tuesday Lake communities
data(TL84, TL86)
BothTL <- CommunityCollection(list(TL84, TL86))
CollectionCPS(BothTL)


# You can't modify CommunityCollections
## Not run: pHWebs[1] <- 'silly'



