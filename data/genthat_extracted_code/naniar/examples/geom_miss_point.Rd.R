library(naniar)


### Name: geom_miss_point
### Title: geom_miss_point
### Aliases: geom_miss_point

### ** Examples


library(ggplot2)

# using regular geom_point()
ggplot(airquality,
       aes(x = Ozone,
           y = Solar.R)) +
geom_point()

# using  geom_miss_point()
ggplot(airquality,
       aes(x = Ozone,
           y = Solar.R)) +
 geom_miss_point()

 # using facets

ggplot(airquality,
       aes(x = Ozone,
           y = Solar.R)) +
 geom_miss_point() +
 facet_wrap(~Month)




