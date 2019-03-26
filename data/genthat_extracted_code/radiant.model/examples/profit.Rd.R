library(radiant.model)


### Name: profit
### Title: Calculate Profit based on cost:margin ratio
### Aliases: profit

### ** Examples

profit(runif(20000), dvd$buy, "yes", cost = 1, margin = 2)
profit(ifelse(dvd$buy == "yes", 1, 0), dvd$buy, "yes", cost = 1, margin = 20)
profit(ifelse(dvd$buy == "yes", 1, 0), dvd$buy)




