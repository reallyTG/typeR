library(mixdist)


### Name: mixgroup
### Title: Construct Grouped Data from Raw Data
### Aliases: mixgroup
### Keywords: misc utilities

### ** Examples

data(pikeraw) # load raw data `pikeraw'
pikeraw # display the data set `pikeraw'
mixgroup(pikeraw) # group raw data
pikemd <- mixgroup(pikeraw, breaks = c(0, seq(19.75, 65.75, 2), 80))
plot(pikemd)
mixgroup(pikeraw, breaks = c(0, seq(19.75, 65.75, 2), 80), usecondit = TRUE, k = 5)
# construct grouped data associated with conditional data
mixgroup(pikeraw, usecondit = TRUE)
mixgroup(pikeraw, usecondit = TRUE, k = 3) # grouping data with a warning message
mixgroup(pikeraw, usecondit = TRUE, k = 8)



