library(radiant.basics)


### Name: plot.goodness
### Title: Plot method for the goodness function
### Aliases: plot.goodness

### ** Examples

result <- goodness(newspaper, "Income")
plot(result, check = c("observed", "expected", "chi_sq"))
goodness(newspaper, "Income") %>% plot(c("observed","expected"))




