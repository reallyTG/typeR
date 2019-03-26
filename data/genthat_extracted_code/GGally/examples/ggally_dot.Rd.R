library(GGally)


### Name: ggally_dot
### Title: Plots the Box Plot with Dot
### Aliases: ggally_dot ggally_dot_no_facet
### Keywords: hplot

### ** Examples

 data(tips, package = "reshape")
 ggally_dot(tips, mapping = ggplot2::aes(x = total_bill, y = sex))
 ggally_dot(tips, mapping = ggplot2::aes_string(x = "total_bill", y = "sex"))
 ggally_dot(
   tips,
   mapping = ggplot2::aes_string(y = "total_bill", x = "sex", color = "sex")
 )
 ggally_dot(
   tips,
   mapping = ggplot2::aes_string(y = "total_bill", x = "sex", color = "sex", shape = "sex")
 ) + ggplot2::scale_shape(solid=FALSE)



