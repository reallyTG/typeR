library(censusapi)


### Name: getCensus
### Title: Retrieve Census data from a given API
### Aliases: getCensus
### Keywords: api

### ** Examples

## No test: 
df <- getCensus(name = "acs/acs5", vintage = 2016,
	vars = c("B01001_001E", "NAME", "B01002_001E", "B19013_001E"),
	region = "tract:*", regionin = "state:06")
head(df)

# Use American Community Survey variable groups to get all data from a given table.
# This returns estimates as well as margins of error and annotation flags.
acs_group <- getCensus(name = "acs/acs5", vintage = 2016,
	vars = c("NAME", "group(B19013)"),
	region = "county:*")
	head(acs_group)

# Retreive block-level data within a specific state and county using a nested regionin argument
data2010 <- getCensus(name = "dec/sf1", vintage = 2010,
vars = c("P001001", "H010001"),
region = "block:*", regionin = "state:36+county:027")
head(data2010)

# Retreive block-level data for Decennial Census sf1, 2000
# Note, for this dataset a tract needs to be specified to retrieve blocks
data2000 <- getCensus(name = "sf1", vintage = 2000,
	vars = c("P001001", "P003001"),
region = "block:*", regionin = "state:36+county:27+tract:010000")
head(data2000)

# Get time series data
saipe <- getCensus(name = "timeseries/poverty/saipe",
	vars = c("NAME", "SAEPOVRT0_17_PT", "SAEPOVRTALL_PT"),
	region = "state:*", time = 2011)
head(saipe)

# Get county business patterns data for a specific NAICS sector
cbp_2016 <- getCensus(name = "cbp",
 vintage = "2016",
 vars = c("EMP", "ESTAB", "NAICS2012_TTL", "GEO_TTL"),
 region = "state:*",
 naics2012 = "23")
 head(cbp_2016)
## End(No test)



