library(eechidna)


### Name: aec_add_carto_f
### Title: aec_add_carto_f - computes and binds the cartogram coordinates
###   to original data
### Aliases: aec_add_carto_f

### ** Examples

library(eechidna)
library(dplyr)
library(ggplot2)
data(nat_map16)
data(nat_data16)
nat_data16 <- nat_data16 %>% select(-c(x,y)) # remove existing cartogram coordinates
nat_data_cart <- aec_add_carto_f(nat_data16)
# Map theme
library(ggthemes)

ggplot(data=nat_data_cart, aes(map_id=id)) +
  geom_map(map = nat_map16, fill="grey90", colour="white") +
    geom_point(aes(x=x, y=y), size=2, alpha=0.4,
                 colour="#572d2c", inherit.aes=FALSE) +
    expand_limits(x=nat_map16$long, y=nat_map16$lat) +
    theme_map() + coord_equal()




