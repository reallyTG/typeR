library(sjmisc)


### Name: descr
### Title: Basic descriptive statistics
### Aliases: descr

### ** Examples

data(efc)
descr(efc, e17age, c160age)

efc$weights <- abs(rnorm(nrow(efc), 1, .3))
descr(efc, c12hour, barthtot, weights = weights)

library(dplyr)
efc %>% select(e42dep, e15relat, c172code) %>% descr()

# with grouped data frames
efc %>%
  group_by(e16sex) %>%
  select(e16sex, e42dep, e15relat, c172code) %>%
  descr()

# you can select variables also inside 'descr()'
efc %>%
  group_by(e16sex, c172code) %>%
  descr(e16sex, c172code, e17age, c160age)

# or even use select-helpers
descr(efc, contains("cop"), max.length = 20)




