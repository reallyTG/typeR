library(PASWR2)


### Name: WOOL
### Title: Wool Production
### Aliases: WOOL
### Keywords: datasets

### ** Examples

ggplot(data = WOOL, aes(location, production, fill = location)) + geom_boxplot() + 
guides(fill = FALSE) + scale_fill_brewer()
t.test(production ~ location, data = WOOL)



