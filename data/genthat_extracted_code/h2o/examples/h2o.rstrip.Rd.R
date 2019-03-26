library(h2o)


### Name: h2o.rstrip
### Title: Strip set from right
### Aliases: h2o.rstrip

### ** Examples

## No test: 
library(h2o)
h2o.init()
string_to_rstrip <- as.h2o("1234567890")
rstrip_string <- h2o.rstrip(string_to_rstrip, "890") #Remove "890"
## End(No test)



