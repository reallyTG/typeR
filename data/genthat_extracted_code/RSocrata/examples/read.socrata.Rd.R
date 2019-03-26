library(RSocrata)


### Name: read.socrata
### Title: Get a full Socrata data set as an R data frame
### Aliases: read.socrata

### ** Examples

# Human-readable URL:
url <- "https://soda.demo.socrata.com/dataset/USGS-Earthquakes-for-2012-11-01-API/4334-bgaj"
df <- read.socrata(url)
# SoDA URL:
df <- read.socrata("http://soda.demo.socrata.com/resource/4334-bgaj.csv")
# Download private dataset
socrataEmail <- Sys.getenv("SOCRATA_EMAIL", "mark.silverberg+soda.demo@socrata.com")
socrataPassword <- Sys.getenv("SOCRATA_PASSWORD", "7vFDsGFDUG")
privateResourceToReadCsvUrl <- "https://soda.demo.socrata.com/resource/a9g2-feh2.csv" # dataset
read.socrata(url = privateResourceToReadCsvUrl, email = socrataEmail, password = socrataPassword)
# Using an API key to read datasets (reduces throttling)
token <- "ew2rEMuESuzWPqMkyPfOSGJgE"
df <- read.socrata("http://soda.demo.socrata.com/resource/4334-bgaj.csv", 
                   app_token = token)
nrow(df)



