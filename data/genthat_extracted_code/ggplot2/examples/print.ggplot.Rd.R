library(ggplot2)


### Name: print.ggplot
### Title: Explicitly draw plot
### Aliases: print.ggplot plot.ggplot
### Keywords: hplot

### ** Examples

colours <- list(~class, ~drv, ~fl)

# Doesn't seem to do anything!
for (colour in colours) {
  ggplot(mpg, aes_(~ displ, ~ hwy, colour = colour)) +
    geom_point()
}

# Works when we explicitly print the plots
for (colour in colours) {
  print(ggplot(mpg, aes_(~ displ, ~ hwy, colour = colour)) +
    geom_point())
}



