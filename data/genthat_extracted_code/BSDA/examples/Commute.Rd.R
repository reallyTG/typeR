library(BSDA)


### Name: Commute
### Title: Commuting times for selected cities in 1980 and 1990
### Aliases: Commute
### Keywords: datasets

### ** Examples


stripplot(year ~ time, data = Commute, jitter = TRUE) 
dotplot(year ~ time, data = Commute)
bwplot(year ~ time, data = Commute)
stripchart(time ~ year, data = Commute, method = "stack", pch = 1, 
           cex = 2, col = c("red", "blue"), 
           group.names = c("1980", "1990"), 
           main = "", xlab = "minutes")
title(main = "Commute Time") 
boxplot(time ~ year, data = Commute, names=c("1980", "1990"),
        horizontal = TRUE, las = 1)





