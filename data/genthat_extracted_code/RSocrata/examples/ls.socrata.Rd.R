library(RSocrata)


### Name: ls.socrata
### Title: List datasets available from a Socrata domain
### Aliases: ls.socrata

### ** Examples

# Download list of data sets
df <- ls.socrata("http://soda.demo.socrata.com")
# Check schema definition for metadata
attributes(df)



