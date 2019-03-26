library(parsnip)


### Name: mars
### Title: General Interface for MARS
### Aliases: mars update.mars

### ** Examples

mars(mode = "regression", num_terms = 5)
model <- mars(num_terms = 10, prune_method = "none")
model
update(model, num_terms = 1)
update(model, num_terms = 1, fresh = TRUE)



