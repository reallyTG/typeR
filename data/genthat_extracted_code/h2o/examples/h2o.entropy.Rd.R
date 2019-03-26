library(h2o)


### Name: h2o.entropy
### Title: Shannon entropy
### Aliases: h2o.entropy

### ** Examples

## No test: 
library(h2o)
h2o.init()
buys <- as.h2o(c("no", "no", "yes", "yes", "yes", "no", "yes", "no", "yes", "yes","no"))
buys_entropy <- h2o.entropy(buys)
## End(No test)



