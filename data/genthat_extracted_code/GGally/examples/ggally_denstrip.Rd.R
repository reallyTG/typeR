library(GGally)


### Name: ggally_denstrip
### Title: Plots a tile plot with facets
### Aliases: ggally_denstrip
### Keywords: hplot

### ** Examples

 data(tips, package = "reshape")
 ggally_denstrip(tips, mapping = ggplot2::aes(x = total_bill, y = sex))
 ggally_denstrip(tips, mapping = ggplot2::aes_string(x = "total_bill", y = "sex"))
 ggally_denstrip(
   tips,
   mapping = ggplot2::aes_string(x = "sex", y = "tip", binwidth = "0.2")
 ) + ggplot2::scale_fill_gradient(low = "grey80", high = "black")



