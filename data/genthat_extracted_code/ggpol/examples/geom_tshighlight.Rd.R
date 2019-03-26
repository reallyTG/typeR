library(ggpol)


### Name: geom_tshighlight
### Title: Timeseries highlighting
### Aliases: geom_tshighlight

### ** Examples

ggplot(economics, aes(x = date, y = unemploy)) + 
  geom_line() +
  geom_tshighlight(aes(xmin = as.Date("01/01/1990", format = "%d/%m/%Y"), 
                       xmax = as.Date("01/01/2000", format = "%d/%m/%Y")),
                   alpha = 0.01)



