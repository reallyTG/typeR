## ---- echo = FALSE-------------------------------------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
knitr::opts_chunk$set(purl = NOT_CRAN,
											comment = "#>")

## ---- eval = FALSE-------------------------------------------------------
#  # Add key to .Renviron
#  Sys.setenv(CENSUS_KEY=YOURKEYHERE)
#  # Reload .Renviron
#  readRenviron("~/.Renviron")
#  # Check to see that the expected key is output in your R console
#  Sys.getenv("CENSUS_KEY")

## ---- message = FALSE----------------------------------------------------
library(censusapi)

## ---- eval = FALSE-------------------------------------------------------
#  apis <- listCensusApis()
#  View(apis)

## ------------------------------------------------------------------------
sahie_vars <- listCensusMetadata(name = "timeseries/healthins/sahie", 
	type = "variables")
head(sahie_vars)

## ------------------------------------------------------------------------
listCensusMetadata(name = "timeseries/healthins/sahie", 
	type = "geography")

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
getCensus(name = "timeseries/healthins/sahie",
	vars = c("NAME", "IPRCAT", "IPR_DESC", "PCTUI_PT"), 
	region = "us:*", 
	time = 2016)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
sahie_states <- getCensus(name = "timeseries/healthins/sahie",
	vars = c("NAME", "IPRCAT", "IPR_DESC", "PCTUI_PT"), 
	region = "state:*", 
	time = 2016)
head(sahie_states)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
sahie_counties <- getCensus(name = "timeseries/healthins/sahie",
	vars = c("NAME", "IPRCAT", "IPR_DESC", "PCTUI_PT"), 
	region = "county:*", 
	regionin = "state:1,2", 
	time = 2016)
head(sahie_counties, n=12L)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
sahie_years <- getCensus(name = "timeseries/healthins/sahie",
	vars = c("NAME", "PCTUI_PT"), 
	region = "state:1", 
	time = "from 2006 to 2016")
head(sahie_years)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
acs_income <- getCensus(name = "acs/acs5",
	vintage = 2016, 
	vars = c("NAME", "B19013_001E", "B19013_001EA", "B19013_001M", "B19013_001MA"), 
	region = "tract:*", 
	regionin = "state:02")
head(acs_income)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
acs_income_group <- getCensus(name = "acs/acs5", 
	vintage = 2016, 
	vars = c("NAME", "group(B19013)"), 
	region = "tract:*", 
	regionin = "state:02")
head(acs_income_group)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
acs_poverty_group <- getCensus(name = "acs/acs5",
	vintage = 2016, 
	vars = c("NAME", "group(B17020)"), 
	region = "tract:*",
	regionin = "state:02")
# List column names
colnames(acs_poverty_group)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
fips
tracts <- NULL
for (f in fips) {
	stateget <- paste("state:", f, sep="")
	temp <- getCensus(name = "sf3",
		vintage = 1990,
		vars = c("P0070001", "P0070002", "P114A001"),
		region = "tract:*",
		regionin = stateget)
	tracts <- rbind(tracts, temp)
}
head(tracts)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
data2010 <- getCensus(name = "dec/sf1",
	vintage = 2010,
	vars = "P001001", 
	region = "block:*",
	regionin = "state:36+county:027")
head(data2010)

## ---- purl = NOT_CRAN, eval = NOT_CRAN-----------------------------------
data2000 <- getCensus(name = "sf1",
	vintage = 2000,
	vars = "P001001", 
	region = "block:*",
	regionin = "state:36+county:027+tract:010000")
head(data2000)

