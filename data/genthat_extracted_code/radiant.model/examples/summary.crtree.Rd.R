library(radiant.model)


### Name: summary.crtree
### Title: Summary method for the crtree function
### Aliases: summary.crtree

### ** Examples

result <- crtree(titanic, "survived", c("pclass", "sex"), lev = "Yes")
summary(result)
result <- crtree(diamonds, "price", c("carat", "color"), type = "regression")
summary(result)




