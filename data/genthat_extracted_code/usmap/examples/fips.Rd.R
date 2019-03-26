library(usmap)


### Name: fips
### Title: Retrieve FIPS code for either a US state or county
### Aliases: fips

### ** Examples

fips("NJ")
fips("California")

fips(c("AK", "CA", "UT"))

fips("CA", county = "orange")
fips(state = "AL", county = "autauga")
fips(state = "Alabama", county = "Autauga County")



