library(mosaicData)


### Name: Countries
### Title: Countries
### Aliases: Countries
### Keywords: datasets

### ** Examples

data(Countries)
subset(Countries, maps=="Yugoslavia")  # Where has Yugoslavia gone?
subset(Countries, is.na(gapminder))    # Things from maps with no Gapminder equivalent
subset(Countries, is.na(maps))         # Things from Gapminder with no maps equivalent



