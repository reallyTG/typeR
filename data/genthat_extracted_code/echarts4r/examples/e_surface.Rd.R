library(echarts4r)


### Name: e_surface
### Title: Surface
### Aliases: e_surface e_surface_

### ** Examples

data("volcano")

surface <- as.data.frame(as.table(volcano))
surface$Var1 <- as.numeric(surface$Var1)
surface$Var2 <- as.numeric(surface$Var2)

surface %>% 
  e_charts(Var1) %>% 
  e_surface(Var2, Freq) %>% 
  e_visual_map(Freq)




