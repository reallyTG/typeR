library(psych)


### Name: spi
### Title: A sample from the SAPA Personality Inventory including an item
###   dictionary and scoring keys.
### Aliases: spi spi.dictionary spi.keys
### Keywords: datasets

### ** Examples

data(spi)
data(sapa.dictionary)
bestScales(spi, criteria="health",dictionary=spi.dictionary)

sc <- scoreVeryFast(spi.keys,spi) #much faster scoring for just scores
sc <- scoreItems(spi.keys,spi)  #gives the alpha reliabilities and various stats 

corPlot(sc$corrected,numbers=TRUE,cex=.4,xlas=2,min.length=6,
     main="Structure of SPI (disattenuated r above the diagonal)")



