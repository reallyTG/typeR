library(GGally)


### Name: ggmatrix_gtable
### Title: Print ggmatrix object
### Aliases: ggmatrix_gtable

### ** Examples

data(tips, package = "reshape")
pm <- ggpairs(tips, c(1,3,2), mapping = ggplot2::aes_string(color = "sex"))
ggmatrix_gtable(pm)



