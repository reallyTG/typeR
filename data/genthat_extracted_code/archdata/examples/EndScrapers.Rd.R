library(archdata)


### Name: EndScrapers
### Title: Upper Paleolithic End Scrapers from Castenet A and Ferrassie H,
###   France
### Aliases: EndScrapers
### Keywords: datasets

### ** Examples

data(EndScrapers)
xtabs(Freq~Site+Curvature, EndScrapers)
xtabs(Freq~Curvature+Sides+Site, EndScrapers)



