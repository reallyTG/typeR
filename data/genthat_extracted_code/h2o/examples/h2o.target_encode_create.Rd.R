library(h2o)


### Name: h2o.target_encode_create
### Title: Create Target Encoding Map
### Aliases: h2o.target_encode_create

### ** Examples

## No test: 
library(h2o)
h2o.init()

# Get Target Encoding Map on bank-additional-full data with numeric response
data <- h2o.importFile(
path = "https://s3.amazonaws.com/h2o-public-test-data/smalldata/demos/bank-additional-full.csv")
mapping_age <- h2o.target_encode_create(data = data, x = list(c("job"), c("job", "marital")), 
                                        y = "age")
head(mapping_age)

# Get Target Encoding Map on bank-additional-full data with binary response
mapping_y <- h2o.target_encode_create(data = data, x = list(c("job"), c("job", "marital")), 
                                      y = "y")
head(mapping_y)

## End(No test)



