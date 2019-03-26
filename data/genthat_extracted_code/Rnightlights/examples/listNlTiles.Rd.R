library(Rnightlights)


### Name: listNlTiles
### Title: List locally cached tiles
### Aliases: listNlTiles

### ** Examples

#list all tiles
listNlTiles()

#list all VIIRS tiles
listNlTiles(nlTypes = "VIIRS")

#list all VIIRS tiles available in the years 2014-2015. Note VIIRS data
#starts in 201401
listNlTiles(nlTypes = "VIIRS.M", nlPeriods = nlRange("201401", "201512"))

#filter data
listNlTiles(nlTypes = "OLS.Y", nlPeriods = c("2012", "2013"))




