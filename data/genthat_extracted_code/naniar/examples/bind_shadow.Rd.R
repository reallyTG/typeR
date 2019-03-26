library(naniar)


### Name: bind_shadow
### Title: Bind a shadow dataframe to original data
### Aliases: bind_shadow

### ** Examples


bind_shadow(airquality)

# bind only the variables that contain missing values
bind_shadow(airquality, only_miss = TRUE)

aq_shadow <- bind_shadow(airquality)

# explore missing data visually
library(ggplot2)

# using the bounded shadow to visualise Ozone according to whether Solar
# Radiation is missing or not.

ggplot(data = aq_shadow,
       aes(x = Ozone)) +
       geom_histogram() +
       facet_wrap(~Solar.R_NA,
       ncol = 1)




