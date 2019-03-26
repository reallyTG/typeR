library(PASWR2)


### Name: RATBP
### Title: Rat Blood Pressure
### Aliases: RATBP
### Keywords: datasets

### ** Examples

# Boxplot
ggplot(data = RATBP, aes(x = group, y = mmHg)) + geom_boxplot()
ggplot(data = RATBP, aes(x = group, y = mmHg, fill = group)) + geom_boxplot() + 
guides(fill = FALSE) + labs(x = "", y = "drops in blood pressure in mm  of Hg") + 
scale_fill_brewer()



