library(PKPDmisc)


### Name: fill_forward
### Title: given NA values fill them with the final non-na value
### Aliases: fill_forward

### ** Examples

fill_forward(c(1.0, NA, 2))
fill_forward(c(NA, 1, NA, 2))
library(dplyr)
df <- data_frame(id = c(1, 1, 2, 2), obs = c(1.2, 4.8, 2.5, NA))
df %>% group_by(id) %>% mutate(obs_locf = fill_forward(obs))



