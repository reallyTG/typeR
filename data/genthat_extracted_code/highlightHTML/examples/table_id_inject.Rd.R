library(highlightHTML)


### Name: table_id_inject
### Title: Table hash addition for markup
### Aliases: table_id_inject

### ** Examples

library(dplyr)
library(highlightHTML)

mtcars %>% 
  group_by(cyl) %>% 
  summarise(avg_mpg = mean(mpg), sd_mpg = sd(mpg)) %>%
  data.frame() %>% 
  table_id_inject(id = c('#bgred', '#bgblue', '#bggreen'), 
     conditions = c('< 2', '> 16', '== 15.1'))
  

mtcars %>% 
  group_by(cyl) %>% 
  summarise(avg_mpg = mean(mpg), sd_mpg = sd(mpg)) %>%
  data.frame() %>%
  table_id_inject(id = c('#bgred', '#bgblue'),
     conditions = c('<= 2', '< 16'), 
     variable = list(c('sd_mpg'), c('avg_mpg')))  
  
# text example
storms %>%
  group_by(status) %>%
  summarise(avg_wind = mean(wind)) %>%
  data.frame() %>%
  table_id_inject(id = c('#bgred'),
     conditions = c('== "tropical depression"'))
     
     
# Table object
table(mtcars$cyl, mtcars$disp) %>%
  table_id_inject(id = c('#bgred'), 
                conditions = c('>= 3'))
  



