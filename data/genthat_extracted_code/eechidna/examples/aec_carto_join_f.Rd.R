library(eechidna)


### Name: aec_carto_join_f
### Title: aec_carto_join_f - bind the cartogram coordinates to original
###   data
### Aliases: aec_carto_join_f

### ** Examples

library(dplyr)
library(ggplot2)
data(nat_map16)
data(nat_data16)
nat_data16 <- nat_data16 %>% select(-c(x,y)) # remove existing cartogram coordinates
cities <- list(c(151.2, -33.8), # Sydney
c(153.0, -27.5), # Brisbane
c(145.0, -37.8), # Melbourne
c(138.6, -34.9), # Adelaide,
c(115.9, -32.0)) # Perth
expand <- list(c(2,3.8), c(2,3), c(2.6,4.1), c(4,3), c(12,6))
nat_carto <- purrr::map2(.x=cities, .y=expand,
.f=aec_extract_f, aec_data=nat_data16) %>%
  purrr::map_df(aec_carto_f) %>%
    mutate(region=as.integer(as.character(region))) %>%
      rename(id=region)
nat_data_cart <- aec_carto_join_f(nat_data16, nat_carto)
library(ggthemes)

ggplot(data=nat_data16, aes(map_id=id)) +
  geom_map(map = nat_map16, fill="grey90", colour="white") +
    geom_point(data=nat_data_cart, aes(x=x, y=y), size=2, alpha=0.4,
                 colour="#572d2c", inherit.aes=FALSE) +
    expand_limits(x=nat_map16$long, y=nat_map16$lat) +
    theme_map() + coord_equal()
 



