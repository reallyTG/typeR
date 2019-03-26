library(compare)


### Name: compareIgnoreAttrs
### Title: Compare Two Objects with Different Attributes
### Aliases: compareIgnoreAttrs
### Keywords: utilities logic

### ** Examples

model <- list(a=1:26, b=letters)
comparison <- model
attr(comparison, "test") <- "test"
compareIgnoreAttrs(model, comparison)



