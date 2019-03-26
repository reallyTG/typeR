library(h2o)


### Name: h2o.lstrip
### Title: Strip set from left
### Aliases: h2o.lstrip

### ** Examples

## No test: 
library(h2o)
h2o.init()
string_to_lstrip <- as.h2o("1234567890")
lstrip_string <- h2o.lstrip(string_to_lstrip, "123") #Remove "123"
## End(No test)



