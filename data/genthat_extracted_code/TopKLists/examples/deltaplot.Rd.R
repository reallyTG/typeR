library(TopKLists)


### Name: deltaplot
### Title: An exploratory plot of discordance for delta selection.
### Aliases: deltaplot

### ** Examples

set.seed(1234)
data(breast)
##plot subplot
a = deltaplot(breast, deltas = 1:50, subplot=TRUE)

##don't plot subplot (default)
a = deltaplot(breast, deltas=1:50, subplot = FALSE)



