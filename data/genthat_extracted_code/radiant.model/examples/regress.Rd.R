library(radiant.model)


### Name: regress
### Title: Linear regression using OLS
### Aliases: regress

### ** Examples

regress(diamonds, "price", c("carat", "clarity"), check = "standardize") %>% summary()
regress(diamonds, "price", c("carat", "clarity")) %>% str()




