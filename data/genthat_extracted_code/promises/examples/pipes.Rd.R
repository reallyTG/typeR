library(promises)


### Name: pipes
### Title: Promise pipe operators
### Aliases: pipes %...>% %...T>% %...!% %...T!%

### ** Examples

## No test: 
library(future)
plan(multisession)

future(cars) %...>%
  head(5) %...T>%
  print()

# If the read.csv fails, resolve to NULL instead
future(read.csv("http://example.com/data.csv")) %...!%
  { NULL }
## End(No test)




