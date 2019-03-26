library(fastR2)


### Name: Ice
### Title: Cooling muscles with ice
### Aliases: Ice
### Keywords: datasets

### ** Examples


data(Ice)
gf_point(weight ~ skinfold, color = ~ sex, data = Ice)
if (require(readr) && require(tidyr)) {
  Ice2 <- Ice %>% 
  gather("key", "temp", b0:r12000) %>% 
  separate(key, c("phase", "time"), sep = 1) %>% 
  mutate(time = parse_number(time), subject = as.character(subject))  
  
  gf_line( temp ~ time, data = Ice2 %>% filter(phase == "t"), 
           color = ~ sex,  group = ~subject, alpha = 0.6) %>%
    gf_facet_grid( treatment ~ location)
}




