library(mondate)


### Name: as.data.frame method
### Title: Coerce a mondate to a Data Frame
### Aliases: as.data.frame.mondate

### ** Examples

YE <- mondate.mdy(12, 31, 2001:2005)
data.frame(yearend = YE, value = 1000 * 1.05^(1:5)) # 5% annual inflation



