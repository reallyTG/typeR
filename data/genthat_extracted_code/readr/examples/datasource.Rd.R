library(readr)


### Name: datasource
### Title: Create a source object.
### Aliases: datasource
### Keywords: internal

### ** Examples

# Literal csv
datasource("a,b,c\n1,2,3")
datasource(charToRaw("a,b,c\n1,2,3"))

# Strings
datasource(readr_example("mtcars.csv"))
datasource(readr_example("mtcars.csv.bz2"))
datasource(readr_example("mtcars.csv.zip"))
## Not run: 
##D datasource("https://github.com/tidyverse/readr/raw/master/inst/extdata/mtcars.csv")
## End(Not run)

# Connection
con <- rawConnection(charToRaw("abc\n123"))
datasource(con)
close(con)



