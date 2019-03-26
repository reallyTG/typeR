library(rworldmap)


### Name: isoToName
### Title: Returns the country name corresponding to the passed iso code (3
###   letter, 2 letter or numeric).
### Aliases: isoToName
### Keywords: manip

### ** Examples


isoToName('gb')
isoToName('gbr')
isoToName(826)
isoToName('uk') #generates a warning and returns NA
#beware that using nameColumn may be vulnerable to future changes 
#in column names in Natural Earth data
isoToName('gb',nameColumn='ABBREV') #returns abbreviation
isoToName('gb',nameColumn='ISO_A3') #returns iso3 for this iso2
isoToName('gbr',nameColumn='continent') #returns continent for this iso3




