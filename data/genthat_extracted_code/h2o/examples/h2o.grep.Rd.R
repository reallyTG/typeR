library(h2o)


### Name: h2o.grep
### Title: Search for matches to an argument pattern
### Aliases: h2o.grep

### ** Examples

## No test: 
library(h2o)
h2o.init()
addresses <- as.h2o(c("2307", "Leghorn St", "Mountain View", "CA", "94043"))
zip.codes <- addresses[h2o.grep("[0-9]{5}", addresses, output.logical = TRUE),]
## End(No test)



