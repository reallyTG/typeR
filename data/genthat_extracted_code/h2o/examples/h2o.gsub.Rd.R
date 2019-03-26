library(h2o)


### Name: h2o.gsub
### Title: String Global Substitute
### Aliases: h2o.gsub

### ** Examples

## No test: 
library(h2o)
h2o.init()
string_to_gsub <- as.h2o("r tutorial")
sub_string <- h2o.gsub("r ", "H2O ", string_to_gsub)
## End(No test)



