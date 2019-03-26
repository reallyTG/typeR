library(radiant.model)


### Name: nb
### Title: Naive Bayes using e1071::naiveBayes
### Aliases: nb

### ** Examples

nb(titanic, "survived", c("pclass", "sex", "age")) %>% summary()
nb(titanic, "survived", c("pclass", "sex", "age")) %>% str()




