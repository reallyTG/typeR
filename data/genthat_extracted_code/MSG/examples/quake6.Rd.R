library(MSG)


### Name: quake6
### Title: Earth quakes from 1973 to 2010
### Aliases: quake6

### ** Examples

data(quake6)
library(ggplot2)
qplot(year, month, data = quake6) + stat_sum(aes(size = ..n..)) + 
    scale_size(range = c(1, 10))



