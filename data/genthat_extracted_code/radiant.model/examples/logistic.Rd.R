library(radiant.model)


### Name: logistic
### Title: Logistic regression
### Aliases: logistic

### ** Examples

logistic(titanic, "survived", c("pclass", "sex"), lev = "Yes") %>% summary()
logistic(titanic, "survived", c("pclass", "sex")) %>% str()




