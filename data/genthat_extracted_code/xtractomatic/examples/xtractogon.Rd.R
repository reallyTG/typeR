library(xtractomatic)


### Name: xtractogon
### Title: Extract environmental data in a polygon using ERDDAP.
### Aliases: xtractogon

### ** Examples

tpos <- c("2014-09-01", "2014-10-01")
xpos <- mbnms$Longitude
ypos <- mbnms$Latitude
sanctchl <- xtractogon('erdVH3chlamday', xpos, ypos, tpos = tpos )



