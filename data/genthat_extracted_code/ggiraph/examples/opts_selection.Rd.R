library(ggiraph)


### Name: opts_selection
### Title: selection effect settings
### Aliases: opts_selection

### ** Examples

library(ggplot2)

dataset <- mtcars
dataset$carname = row.names(mtcars)

gg <- ggplot(
  data = dataset,
  mapping = aes(x = wt, y = qsec, color = disp,
                tooltip = carname, data_id = carname) ) +
  geom_point_interactive() + theme_minimal()

x <- girafe(ggobj = gg)
x <- girafe_options(x,
  opts_selection(type = "multiple",
    css = "fill:red;stroke:gray;r:5pt;") )
if( interactive() ) print(x)



