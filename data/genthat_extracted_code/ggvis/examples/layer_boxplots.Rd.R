library(ggvis)


### Name: layer_boxplots
### Title: Display data with a boxplot.
### Aliases: layer_boxplots

### ** Examples

library(dplyr)

mtcars %>% ggvis(~factor(cyl), ~mpg) %>% layer_boxplots()
# Set the width of the boxes to half the space between tick marks
mtcars %>% ggvis(~factor(cyl), ~mpg) %>% layer_boxplots(width = 0.5)

# Continuous x: boxes fill width between data values
mtcars %>% ggvis(~cyl, ~mpg) %>% layer_boxplots()
# Setting width=0.5 makes it 0.5 wide in the data space, which is 1/4 of the
# distance between data values in this particular case.
mtcars %>% ggvis(~cyl, ~mpg) %>% layer_boxplots(width = 0.5)

# Smaller outlier points
mtcars %>% ggvis(~factor(cyl), ~mpg) %>% layer_boxplots(size := 20)



