library(Fragman)


### Name: detect.ladder
### Title: Ladder detection by correlation or confidence intervals
### Aliases: detect.ladder

### ** Examples

data(my.plants)
my.ladder <- c(120, 125, 129, 150, 175, 200, 225, 250, 275, 300, 325, 350, 375)
# looking at the first individual
detect.ladder(stored=my.plants, ind=1, ladder=my.ladder)



