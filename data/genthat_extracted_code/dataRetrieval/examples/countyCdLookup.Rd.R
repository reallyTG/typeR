library(dataRetrieval)


### Name: countyCdLookup
### Title: County code look up
### Aliases: countyCdLookup

### ** Examples

id <- countyCdLookup(state = "WI", county = "Dane")
name <- countyCdLookup(state = "OH", county = 13, output = "fullName")
index <- countyCdLookup(state = "Pennsylvania", county = "ALLEGHENY COUNTY", output = "tableIndex")
fromIDs <- countyCdLookup(state = 13, county = 5, output = "fullName")
already_correct <- countyCdLookup(county = "51001")



