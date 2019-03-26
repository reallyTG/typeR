library(qtl)


### Name: orderMarkers
### Title: Find an initial order for markers within chromosomes
### Aliases: orderMarkers
### Keywords: utilities

### ** Examples

data(listeria)
pull.map(listeria, chr=3)
revcross <- orderMarkers(listeria, chr=3, use.ripple=FALSE)
pull.map(revcross, chr=3)



