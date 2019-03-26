library(rpdo)


### Name: pdo
### Title: Pacific Decadal Oscillation Index
### Aliases: pdo
### Keywords: datasets

### ** Examples

library(rpdo)
library(ggplot2)

data(pdo)
ggplot(data = subset(pdo, pdo$Month == 1), aes(x = Year, y = PDO)) +
 geom_line() + ylab("January PDO Index")



