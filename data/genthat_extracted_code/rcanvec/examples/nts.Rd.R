library(rcanvec)


### Name: nts
### Title: Generate NTS References
### Aliases: nts

### ** Examples

nts('21h')
nts('21h1')
nts('21h1', '21a16', '021A15')
nts(lat=45.2, lon=-64.32)
nts(lat=c(45.2, 46.2), lon=c(-64.32, -64.81))

library(prettymapr)
nts(bbox=makebbox(45.125, -64.25, 44.875, -64.75))




