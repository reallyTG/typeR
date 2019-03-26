library(echarts4r)


### Name: connections
### Title: Connect charts
### Aliases: connections e_connect e_group e_connect_group
###   e_disconnect_group e_arrange

### ** Examples

# linked datazoom
e1 <- cars %>% 
  e_charts(
    speed,
    height = 200
  ) %>% 
  e_scatter(dist) %>% 
  e_datazoom(show = FALSE) %>% 
  e_group("grp") # assign group
  
e2 <- cars %>% 
  e_charts(
    dist,
    height = 200
  ) %>% 
  e_scatter(speed) %>% 
  e_datazoom() %>% 
  e_group("grp") %>%  # assign group
  e_connect_group("grp") # connect

e_arrange(e1, e2, title = "Linked datazoom")




