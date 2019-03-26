library(GISTools)


### Name: Polygon Label Points
### Title: Number of Points in Each Polygon
### Aliases: poly.labels

### ** Examples

# Data for New Haven to use in example
data(newhaven)
# How many breaches of peace in each census block?
n.breach = poly.counts(breach,blocks)
# Compute densities and map them
choropleth(blocks,n.breach/blocks$AREA)



