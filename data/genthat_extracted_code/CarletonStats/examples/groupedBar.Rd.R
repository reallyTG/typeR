library(CarletonStats)


### Name: groupedBar
### Title: Grouped bar chart
### Aliases: groupedBar groupedBar.default groupedBar.formula
### Keywords: bar grouped plot

### ** Examples



groupedBar(states03$Region)

groupedBar(states03$DeathPenalty, states03$Region, legend.loc = "topleft")

#Using a formula syntax:
groupedBar(~Region, data = states03)
groupedBar(DeathPenalty ~ Region, data = states03, legend.loc = "topleft")





