library(read.dbc)


### Name: read.dbc
### Title: Read Data Stored in DBC (compressed DBF) Files
### Aliases: read.dbc
### Keywords: datasus dbc

### ** Examples

# The 'sids.dbc' file is the compressed version of 'sids.dbf' from the "foreign" package.
x <- read.dbc(system.file("files/sids.dbc", package="read.dbc"))
str(x)
summary(x)

# This is a small subset of U.S. NOAA storm database.
storm <- read.dbc(system.file("files/storm.dbc", package="read.dbc"))
head(x)
str(x)

## No test: 
## Don't run!
## The following code will download data from the "Declarations of Death" database for
## the Brazilian state of Parana, year 2013. Source: DATASUS / Brazilian Ministry of Health
url <- "ftp://ftp.datasus.gov.br/dissemin/publicos/SIM/CID10/DORES/DOPR2013.dbc"
download.file(url, destfile = "DOPR2013.dbc")
dopr <- read.dbc("DOPR2013.dbc")
head(dopr)
str(dopr)
## End(No test)



