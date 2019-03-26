library(h2o)


### Name: h2o.substring
### Title: Substring
### Aliases: h2o.substring h2o.substr

### ** Examples

## No test: 
library(h2o)
h2o.init()
string_to_substring <- as.h2o("1234567890")
substr <- h2o.substring(string_to_substring, 2) #Get substring from second index onwards
## End(No test)



