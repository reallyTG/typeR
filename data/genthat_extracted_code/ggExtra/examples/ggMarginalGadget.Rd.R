library(ggExtra)


### Name: ggMarginalGadget
### Title: ggMarginal gadget
### Aliases: ggMarginalGadget

### ** Examples

if (interactive()) {
  plot <- ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) + ggplot2::geom_point()
  plot2 <- ggMarginalGadget(plot)
}



