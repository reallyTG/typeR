library(geomorph)


### Name: geomorph.data.frame
### Title: Create a data frame with shape data
### Aliases: geomorph.data.frame
### Keywords: utilities

### ** Examples

data(plethodon) 
Y.gpa <- gpagen(plethodon$land,PrinAxes=FALSE)
gdf <- geomorph.data.frame(Y.gpa)
attributes(gdf)

gdf <- geomorph.data.frame(Y.gpa, species = plethodon$species, site = plethodon$site)
attributes(gdf)

# Using geomorph.data.frame to facilitate analysis
procD.lm(coords ~ Csize + species * site, data = gdf)



