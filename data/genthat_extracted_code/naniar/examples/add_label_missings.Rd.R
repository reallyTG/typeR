library(naniar)


### Name: add_label_missings
### Title: Add a column describing if there are any missings in the dataset
### Aliases: add_label_missings

### ** Examples


airquality %>% add_label_missings()
airquality %>% add_label_missings(Ozone)
airquality %>% add_label_missings(Ozone, Solar.R)
airquality %>% add_label_missings(Ozone, Solar.R, missing = "yes", complete = "no")




