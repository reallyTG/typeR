library(dataPreparation)


### Name: one_hot_encoder
### Title: One hot encoder
### Aliases: one_hot_encoder

### ** Examples

data(messy_adult)

# Compute encoding
encoding <- build_encoding(messy_adult, cols = c("marital", "occupation"), verbose = TRUE)

# Apply it
messy_adult <- one_hot_encoder(messy_adult, encoding = encoding, drop = TRUE)

# Apply same encoding to adult
data(adult)
adult <- one_hot_encoder(adult, encoding = encoding, drop = TRUE)

# To have encoding as logical (TRUE/FALSE), pass it in type argument
data(adult)
adult <- one_hot_encoder(adult, encoding = encoding, type = "logical", drop = TRUE)



