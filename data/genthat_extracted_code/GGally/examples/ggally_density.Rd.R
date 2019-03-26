library(GGally)


### Name: ggally_density
### Title: Plots the Scatter Density Plot
### Aliases: ggally_density
### Keywords: hplot

### ** Examples

 data(tips, package = "reshape")
 ggally_density(tips, mapping = ggplot2::aes(x = total_bill, y = tip))
 ggally_density(tips, mapping = ggplot2::aes_string(x = "total_bill", y = "tip"))
 ggally_density(
   tips,
   mapping = ggplot2::aes_string(x = "total_bill", y = "tip", fill = "..level..")
 )
 ggally_density(
   tips,
   mapping = ggplot2::aes_string(x = "total_bill", y = "tip", fill = "..level..")
 ) + ggplot2::scale_fill_gradient(breaks = c(0.05, 0.1, 0.15, 0.2))



