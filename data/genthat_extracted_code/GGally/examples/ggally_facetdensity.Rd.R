library(GGally)


### Name: ggally_facetdensity
### Title: Plots the density plots by faceting
### Aliases: ggally_facetdensity
### Keywords: hplot

### ** Examples

 data(tips, package = "reshape")
 ggally_facetdensity(tips, mapping = ggplot2::aes(x = total_bill, y = sex))
 ggally_facetdensity(
   tips,
   mapping = ggplot2::aes_string(y = "total_bill", x = "sex", color = "sex")
 )



