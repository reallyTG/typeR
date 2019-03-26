library(GISTools)


### Name: map.scale
### Title: map.scale
### Aliases: map.scale

### ** Examples

# Read in map data for New Haven
data(newhaven)
# Plot census block boundaries
plot(blocks)
# Add a map scale
map.scale(534750,152000,miles2ft(2),"Miles",4,0.5,sfcol='red')
# ... and a title
title('New Haven (CT)')



