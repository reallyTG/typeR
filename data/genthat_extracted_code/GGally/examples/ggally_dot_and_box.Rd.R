library(GGally)


### Name: ggally_dot_and_box
### Title: Plots either Box Plot or Dot Plots
### Aliases: ggally_dot_and_box
### Keywords: hplot

### ** Examples

 data(tips, package = "reshape")
 ggally_dot_and_box(
   tips,
   mapping = ggplot2::aes(x = total_bill, y = sex, color = sex),
   boxPlot = TRUE
 )
 ggally_dot_and_box(
   tips,
   mapping = ggplot2::aes(x = total_bill, y = sex, color = sex),
   boxPlot = FALSE
 )



