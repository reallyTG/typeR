library(PKPDmisc)


### Name: color_pallete
### Title: design-quality color palletes to use in ggplot2
### Aliases: color_pallete

### ** Examples

library(PKPDmisc)
library(ggplot2)
library(dplyr)
ggplot(sd_oral_richpk %>% filter(ID < 10), 
aes(x = Time,
y= Conc, 
group = ID, 
color = Gender)) + 
  geom_line(size = 1.5) + scale_color_manual(values =color_pallete(1)) +
  base_theme()



