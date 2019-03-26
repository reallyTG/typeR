library(EngrExpt)


### Name: weight
### Title: Weight plastic bags held before breaking
### Aliases: weight
### Keywords: datasets

### ** Examples

str(weight)
densityplot(~ weight, weight, xlab = "Weight bag held before breaking")
qqmath(~ weight, weight, ylab = "Weight bag held before breaking",
       aspect = 1, type = c("g","p"), xlab = "Standard normal quantiles")



