library(eechidna)


### Name: aec_extract_f
### Title: aec_extract_f - extract subsets geographically
### Aliases: aec_extract_f

### ** Examples

library(dplyr)
library(ggplot2)
data(nat_map16)
data(nat_data16)
nat_data16 <- nat_data16 %>% select(-c(x,y)) # remove existing cartogram coordinates
adelaide <- aec_extract_f(nat_data16, ctr=c(138.6, -34.9), expand=c(2,3))
ggplot(data=nat_map16) + 
  geom_polygon(aes(x=long, y=lat, group=group, order=order),
    fill="grey90", colour="white") +
  geom_point(data=adelaide, aes(x=long_c, y=lat_c), size=2, alpha=0.4,
    colour="#f0027f") + 
  xlim(c(136, 142)) + ylim(-36, -33) +
  coord_equal()



