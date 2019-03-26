library(ramchoice)


### Name: sumData
### Title: ramchoice Package: Generate Summary Statistics
### Aliases: sumData

### ** Examples

# load data
data(ramdata)

# summary statistics
summaryStats <- sumData(menu, choice)
nrow(summaryStats$sumMenu)
min(summaryStats$sumN)

summaryStats$sumMenu[1, ]
summaryStats$sumProb[1, ]
summaryStats$sumN[1]




