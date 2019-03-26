library(GDAdata)


### Name: EastIndiesTrade
### Title: Figures for the trade between England and the East Indies in the
###   18th century.
### Aliases: EastIndiesTrade
### Keywords: datasets

### ** Examples

data(EastIndiesTrade, package="GDAdata")
library(ggplot2)
ggplot(EastIndiesTrade, aes(x=Year, y=Exports-Imports)) + geom_line()



