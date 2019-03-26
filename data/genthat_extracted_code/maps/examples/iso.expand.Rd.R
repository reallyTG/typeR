library(maps)


### Name: iso.expand
### Title: Identify countries by ISO 3166 codes (2 or 3 letters) or by
###   Sovereignty.
### Aliases: sov.expand iso.expand iso.alpha

### ** Examples

# France and all its overseas departments, territories etc.
sov.expand("France") # France and all its overseas departments, territories etc.

# Canary Islands are not included in map("Spain")
iso.expand("ES")
map(regions=sov.expand("Spain"))

# draw a map with ISO codes as labels:
wm <- map("world", fill=TRUE, col=0, xlim=c(-10,40), ylim=c(30,60))
# take out islands, but you loose e.g. UK, New Zealand, small island states
nam <- grep(":", wm$names, inv=TRUE, val=TRUE)
# ad ISO codes as label
map.text(wm, regions=nam, label=iso.alpha(nam), col=2, exact=TRUE, add=TRUE)



