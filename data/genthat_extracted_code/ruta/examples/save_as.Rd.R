library(ruta)


### Name: save_as
### Title: Save and load Ruta models
### Aliases: save_as load_from

### ** Examples

library(purrr)

x <- as.matrix(iris[, 1:4])

## No test: 
# Save a trained model
saved_file <-
  autoencoder(2) %>%
  train(x) %>%
  save_as("my_model.tar.gz", dir = tempdir())

# Load and use the model
encoded <- load_from(saved_file) %>% encode(x)
## End(No test)



