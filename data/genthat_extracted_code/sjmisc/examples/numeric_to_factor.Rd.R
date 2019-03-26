library(sjmisc)


### Name: numeric_to_factor
### Title: Convert numeric vectors into factors associated value labels
### Aliases: numeric_to_factor

### ** Examples

library(dplyr)
data(efc)
efc %>%
  select(e42dep, e16sex, c12hour, c160age, c172code) %>%
  numeric_to_factor()




