library(GSODR)


### Name: reformat_GSOD
### Title: Tidy and Return a Data Frame of GSOD Weather from Local Data
### Aliases: reformat_GSOD

### ** Examples

## No test: 

# Download data to 'tempdir()'
download.file(url =
  "ftp://ftp.ncdc.noaa.gov/pub/data/gsod/2010/955510-99999-2010.op.gz",
     	destfile = file.path(tempdir(), "955510-99999-2010.op.gz"),
     	mode = "wb")

# Reformat station data files in R's tempdir() directory
tbar <- reformat_GSOD(dsn = tempdir())

tbar
## End(No test)




