library(ggQQunif)


### Name: geom_QQ_unif
### Title: geom_QQ_unif
### Aliases: geom_QQ_unif

### ** Examples

library(ggplot2)
library(dplyr)

set.seed(27599)
d <- data.frame(s = runif(n = 5e3))

d %>%
ggplot(mapping = aes(sample = s)) +
 geom_QQ_unif() +
 scale_x_QQ() +
 scale_y_QQ() +
 theme_minimal()




