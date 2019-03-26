library(tidyboot)


### Name: tidyboot_mean
### Title: Non-parametric bootstrap and empirical central tendency for data
###   frames Designed to make standard use of 'tidyboot.data.frame' easier
### Aliases: tidyboot_mean

### ** Examples

## Mean and 95% confidence interval for 500 samples from two different normal distributions
require(dplyr)
gauss1 <- data_frame(value = rnorm(500, mean = 0, sd = 1), condition = 1)
gauss2 <- data_frame(value = rnorm(500, mean = 2, sd = 3), condition = 2)
df <- bind_rows(gauss1, gauss2)
df %>%
 group_by(condition) %>%
 tidyboot_mean(column = value)



