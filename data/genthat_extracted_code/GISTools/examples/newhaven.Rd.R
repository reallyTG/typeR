library(GISTools)


### Name: newhaven
### Title: New Haven, Connecticut: Crime data with contextual information
### Aliases: newhaven blocks breach famdisp burgres.f burgres.n places
###   roads tracts

### ** Examples

# Read in map data for New Haven
data(newhaven)
# Plot census block boundaries
plot(blocks)
# Add a map scale
map.scale(534750,152000,miles2ft(2),"Miles",4,0.5,sfcol='red')
# ... and a title
title('New Haven (CT)')



