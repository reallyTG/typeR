library(PASWR2)


### Name: TOP20
### Title: Tennis Income
### Aliases: TOP20
### Keywords: datasets

### ** Examples

ggplot(data = TOP20, aes(x = income)) + 
geom_histogram(binwidth = 1, fill = "lightblue", color = "blue") + 
labs(x = "yearly income in millions of dollars")



