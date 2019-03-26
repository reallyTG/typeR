library(PASWR2)


### Name: SWIMTIMES
### Title: Swim Times
### Aliases: SWIMTIMES
### Keywords: datasets

### ** Examples

wilcox.test(seconds ~ diet, data = SWIMTIMES)
ggplot(data = SWIMTIMES, aes(x = diet, y = seconds, fill = diet)) + geom_violin() + 
guides(fill = FALSE) + scale_fill_brewer()



