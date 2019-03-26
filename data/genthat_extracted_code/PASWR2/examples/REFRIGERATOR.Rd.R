library(PASWR2)


### Name: REFRIGERATOR
### Title: Refrigerator Energy Consumption
### Aliases: REFRIGERATOR
### Keywords: datasets

### ** Examples

# Boxplot
ggplot(data = REFRIGERATOR, aes(x = group, y = kilowatts)) + geom_boxplot()
ggplot(data = REFRIGERATOR, aes(x = group, y = kilowatts, fill = group)) + 
geom_boxplot() + labs(y = "energy consumption in kilowatts for a 24 hour period") + 
guides(fill = FALSE) + scale_fill_brewer()



