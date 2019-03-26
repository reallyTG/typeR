library(bootstrap)


### Name: hormone
### Title: Hormone Data from page 107
### Aliases: hormone
### Keywords: datasets

### ** Examples

str(hormone) 
if(interactive())par(ask=TRUE)
with(hormone, stripchart(amount ~ Lot))
with(hormone, plot(amount ~ hrs, pch=Lot))
abline( lm(amount ~ hrs, data=hormone, col="red2"))



