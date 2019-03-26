library(utiml)


### Name: replace_nominal_attributes
### Title: Replace nominal attributes Replace the nominal attributes by
###   binary attributes.
### Aliases: replace_nominal_attributes

### ** Examples

new.toy <- toyml
new.column <- as.factor(sample(c("a","b","c"), 100, replace = TRUE))
new.toy$dataset$ratt10 <- new.column
head(replace_nominal_attributes(new.toy))



