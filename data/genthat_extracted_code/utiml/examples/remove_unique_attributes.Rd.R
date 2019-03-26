library(utiml)


### Name: remove_unique_attributes
### Title: Remove unique attributes
### Aliases: remove_unique_attributes

### ** Examples

alt.toy <- toyml
alt.toy$dataset$ratt10 <- mean(alt.toy$dataset$ratt10)
new.toy <- remove_unique_attributes(alt.toy)



