library(radiant.model)


### Name: crtree
### Title: Classification and regression trees based on the rpart package
### Aliases: crtree

### ** Examples

crtree(titanic, "survived", c("pclass", "sex"), lev = "Yes") %>% summary()
result <- crtree(titanic, "survived", c("pclass", "sex")) %>% summary()
result <- crtree(diamonds, "price", c("carat", "clarity"), type = "regression") %>% str()




