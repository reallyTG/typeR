library(echarts4r)


### Name: e_lm
### Title: Smooth
### Aliases: e_lm e_glm e_loess

### ** Examples

mtcars %>% 
  e_charts(mpg) %>% 
  e_scatter(qsec) %>% 
  e_lm(qsec ~ mpg, name = "y = ax + b")
  
mtcars %>% 
  e_charts(disp) %>% 
  e_scatter(mpg) %>% 
  e_loess(mpg ~ disp)
  
CO2 %>% 
  e_charts(conc) %>% 
  e_scatter(uptake) %>% 
  e_glm(uptake ~ conc, name = "GLM")




