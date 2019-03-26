library(echarts4r)


### Name: e_step
### Title: Step
### Aliases: e_step e_step_

### ** Examples

USArrests %>% 
  dplyr::mutate(State = row.names(.)) %>% 
  e_charts(State) %>%
  e_step(Murder, name = "Start", step = "start", fill = TRUE) %>% 
  e_step(Rape, name = "Middle", step = "middle") %>% 
  e_step(Assault, name = "End", step = "end") %>% 
  e_tooltip(trigger = "axis")




