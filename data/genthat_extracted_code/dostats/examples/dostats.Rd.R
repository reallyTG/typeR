library(dostats)


### Name: dostats
### Title: Convenient interface for computing statistics on a vector
### Aliases: dostats
### Keywords: misc utilities,

### ** Examples

data(mtcars)
library(plyr)
dostats(1:10, mean, median, sd, quantile, IQR)
ldply(mtcars, dostats, median, mean, sd, quantile, IQR)



