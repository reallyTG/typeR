library(echarts4r)


### Name: e_labels
### Title: Format labels
### Aliases: e_labels

### ** Examples

mtcars %>% 
  e_chart(wt) %>% 
  e_scatter(qsec, cyl) %>% 
  e_labels(fontSize = 9)
  
mtcars %>% 
  group_by(cyl) %>% 
  e_chart(wt) %>% 
  e_scatter(qsec, mpg) %>% 
  e_labels(fontSize = 9)

# timeline  
mtcars %>% 
  group_by(cyl) %>% 
  e_chart(wt) %>% 
  e_scatter(qsec, mpg) %>% 
  e_labels(fontSize = 9)




