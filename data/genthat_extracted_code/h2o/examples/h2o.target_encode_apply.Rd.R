library(h2o)


### Name: h2o.target_encode_apply
### Title: Apply Target Encoding Map to Frame
### Aliases: h2o.target_encode_apply

### ** Examples

## No test: 
library(h2o)
h2o.init()

# Get Target Encoding Frame on bank-additional-full data with numeric `y`
data <- h2o.importFile(
  path = "https://s3.amazonaws.com/h2o-public-test-data/smalldata/demos/bank-additional-full.csv")
splits <- h2o.splitFrame(data, seed = 1234)
train <- splits[[1]]
test <- splits[[2]]
mapping <- h2o.target_encode_create(data = train, x = list(c("job"), c("job", "marital")), 
                                    y = "age")

# Apply mapping to the training dataset
train_encode <- h2o.target_encode_apply(data = train, x = list(c("job"), c("job", "marital")), 
                                        y = "age", mapping, holdout_type = "LeaveOneOut")
# Apply mapping to a test dataset
test_encode <- h2o.target_encode_apply(data = test, x = list(c("job"), c("job", "marital")), 
                                       y = "age", target_encode_map = mapping,
                                       holdout_type = "None")

## End(No test)



