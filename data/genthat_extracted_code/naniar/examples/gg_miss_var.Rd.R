library(naniar)


### Name: gg_miss_var
### Title: Plot the number of missings for each variable
### Aliases: gg_miss_var

### ** Examples


gg_miss_var(airquality)
library(ggplot2)
gg_miss_var(airquality) + labs(y = "Look at all the missing ones")
gg_miss_var(airquality, Month)
gg_miss_var(airquality, Month, show_pct = TRUE)
gg_miss_var(airquality, Month, show_pct = TRUE) + ylim(0, 100)




