library(radiant.basics)


### Name: summary.goodness
### Title: Summary method for the goodness function
### Aliases: summary.goodness

### ** Examples

result <- goodness(newspaper, "Income", c(.3, .7))
summary(result, check = c("observed", "expected", "chi_sq"))
goodness(newspaper, "Income", "1/3 2/3") %>% summary("observed")




