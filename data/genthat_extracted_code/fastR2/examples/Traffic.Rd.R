library(fastR2)


### Name: Traffic
### Title: New England traffic fatalities (1951-1959)
### Aliases: Traffic
### Keywords: datasets

### ** Examples


data(Traffic)
gf_line(cn.deaths ~ year, data = Traffic)
if (require(tidyr)) {
  TrafficLong <- 
    Traffic %>% 
    select(-2) %>%
    gather(state, fatality.rate, ny:ri)
   gf_line(fatality.rate ~ year, group = ~state, color = ~state, data = TrafficLong) %>%
     gf_point(fatality.rate ~ year, group = ~state, color = ~state, data = TrafficLong) %>%
		  gf_lims(y = c(0, NA))
}




