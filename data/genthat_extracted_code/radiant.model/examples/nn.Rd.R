library(radiant.model)


### Name: nn
### Title: Neural Networks
### Aliases: nn

### ** Examples

nn(titanic, "survived", c("pclass", "sex"), lev = "Yes") %>% summary()
nn(titanic, "survived", c("pclass", "sex")) %>% str()
nn(diamonds, "price", c("carat", "clarity"), type = "regression") %>% summary()




