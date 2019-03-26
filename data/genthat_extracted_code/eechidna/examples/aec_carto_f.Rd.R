library(eechidna)


### Name: aec_carto_f
### Title: aec_carto_f - run dorling on data centers
### Aliases: aec_carto_f

### ** Examples

library(dplyr)
library(ggplot2)
data(nat_map16)
data(nat_data16)
nat_data16 <- nat_data16 %>% select(-c(x,y)) # remove existing cartogram coordinates
adelaide <- aec_extract_f(nat_data16, ctr=c(138.6, -34.9), expand=c(2,3))
adelaide_carto <- aec_carto_f(adelaide) %>% rename(id=region)
ggplot(data=nat_map16) + 
  geom_path(aes(x=long, y=lat, group=group, order=order),
                 colour="grey50") +
  geom_point(data=adelaide_carto, aes(x=x, y=y), size=4, alpha=0.4,
        colour="#f0027f") + 
        xlim(c(136, 140)) + ylim(-36, -33) +
        coord_equal()
adelaide_all <- merge(adelaide, adelaide_carto, by="id")
ggplot(data=nat_map16) + 
  geom_path(aes(x=long, y=lat, group=group, order=order),
                 colour="grey50") +
  geom_point(data=adelaide_all, aes(x=long_c, y=lat_c), size=2, alpha=0.4,
              colour="#f0027f") + 
  geom_point(data=adelaide_all, aes(x=x, y=y), size=2, alpha=0.4,
                             colour="#f0027f") + 
  geom_segment(data=adelaide_all,
       aes(x=long_c, xend=x, y=lat_c, yend=y), colour="#f0027f") +
  xlim(c(136, 140)) + ylim(-37, -33) +
  coord_equal()





