library(GISTools)


### Name: North Arrow
### Title: Add a north arrow to a map
### Aliases: north.arrow

### ** Examples

# Read in map data for New Haven
data(newhaven)
# Plot census block boundaries
plot(blocks)
# Add a north arrow
north.arrow(534750,152000,miles2ft(0.5),col='cyan')
# ... and a title
title('New Haven (CT)')



