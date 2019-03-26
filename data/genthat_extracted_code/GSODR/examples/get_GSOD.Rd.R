library(GSODR)


### Name: get_GSOD
### Title: Download and Return a Tidy Data Frame of GSOD Weather Data
### Aliases: get_GSOD

### ** Examples

## No test: 
# Download weather station for Toowoomba, Queensland for 2010
tbar <- get_GSOD(years = 2010, station = "955510-99999")

tbar

# Download data for Australia from 2010 to 2015
AUS <- get_GSOD(years = 2010:2015, country = "Australia")

AUS

# Download agroclimatology data for 2015 using parallel processing
future::plan("multisession")
ag <- get_GSOD(years = 2015, agroclimatology = TRUE)

ag

# Download global data for 2010 to 2015 with a maximum allowed 5 missing days
# of data using parallel processing

future::plan("multisession")
global <- get_GSOD(years = 2010:2015, max_missing = 5)

global

## End(No test)



