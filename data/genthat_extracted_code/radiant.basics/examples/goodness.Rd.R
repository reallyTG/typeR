library(radiant.basics)


### Name: goodness
### Title: Evaluate if sample data for a categorical variable is consistent
###   with a hypothesized distribution
### Aliases: goodness

### ** Examples

goodness(newspaper, "Income") %>% str()
table(select(newspaper, Income)) %>% goodness(tab = .)




