library(GGally)


### Name: ggally_facethist
### Title: Plots the Histograms by Faceting
### Aliases: ggally_facethist
### Keywords: hplot

### ** Examples

 data(tips, package = "reshape")
 ggally_facethist(tips, mapping = ggplot2::aes(x = tip, y = sex))
 ggally_facethist(tips, mapping = ggplot2::aes_string(x = "tip", y = "sex"), binwidth = 0.1)



