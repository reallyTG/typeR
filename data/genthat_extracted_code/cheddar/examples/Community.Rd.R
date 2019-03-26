library(cheddar)


### Name: Community
### Title: Community
### Aliases: Community is.Community plot.Community print.Community
###   summary.Community $<-.Community [<-.Community [[<-.Community
###   dim<-.Community length<-.Community levels<-.Community
###   names<-.Community
### Keywords: utilities

### ** Examples

data(TL84)
TL84

# Node properties
NPS(TL84)

# Trophic-link properties
TLPS(TL84)

# Eyeball the data
plot(TL84)

# A different plot function
PlotWebByLevel(TL84)

# Construct a new community.
# TL84.new is an exact copy of TL84
TL84.new <- Community(properties=CPS(TL84), 
                      nodes=NPS(TL84),
                      trophic.links=TLPS(TL84))
identical(TL84, TL84.new)

# A copy of TL84 without trophic links
TL84.no.links <- Community(properties=CPS(TL84), 
                           nodes=NPS(TL84))
NumberOfTrophicLinks(TL84.no.links)

# A community with 10 species and no properties
test <- Community(nodes=data.frame(node=paste('Species', 1:10)), 
                  properties=list(title='Test community'))
test
NPS(test)



