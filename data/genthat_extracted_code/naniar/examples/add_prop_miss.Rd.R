library(naniar)


### Name: add_prop_miss
### Title: Add column containing proportion of missing data values
### Aliases: add_prop_miss

### ** Examples


airquality %>% add_prop_miss()

airquality %>% add_prop_miss(Solar.R)

airquality %>% add_prop_miss(Solar.R, Ozone)

airquality %>% add_prop_miss(Solar.R, Ozone, label = "testing")

# this can be applied to model the proportion of missing data
# as in Tierney et al bmjopen.bmj.com/content/5/6/e007450.full
library(rpart)
library(rpart.plot)

airquality %>%
add_prop_miss() %>%
rpart(prop_miss_all ~ ., data = .) %>%
prp(type = 4,
    extra = 101,
    prefix = "prop_miss = ")



