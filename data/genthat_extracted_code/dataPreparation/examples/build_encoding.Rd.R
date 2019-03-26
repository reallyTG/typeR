library(dataPreparation)


### Name: build_encoding
### Title: Compute encoding
### Aliases: build_encoding

### ** Examples

# Get a data set
data(adult)
encoding <- build_encoding(adult, cols = "auto", verbose = TRUE)

print(encoding)

# To limit the number of generated columns, one can use min_frequency parameter:
build_encoding(adult, cols = "auto", verbose = TRUE, min_frequency = 0.1)
# Set to 0.1, it will create columns only for values that are present 10% of the time.



