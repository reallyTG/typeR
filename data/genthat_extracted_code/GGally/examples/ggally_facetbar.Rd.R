library(GGally)


### Name: ggally_facetbar
### Title: Plots the Bar Plots Faceted by Conditional Variable
### Aliases: ggally_facetbar
### Keywords: hplot

### ** Examples

 data(tips, package = "reshape")
 ggally_facetbar(tips, ggplot2::aes(x = sex, y = smoker, fill = time))
 ggally_facetbar(tips, ggplot2::aes(x = smoker, y = sex, fill = time))



