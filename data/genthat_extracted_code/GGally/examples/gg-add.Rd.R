library(GGally)


### Name: +.gg
### Title: Modify a ggmatrix object by adding an ggplot2 object to all
###   plots
### Aliases: +.gg

### ** Examples

data(tips, package = "reshape")
pm <- ggpairs(tips[, 2:3])
## change to black and white theme
pm + ggplot2::theme_bw()
## change to linedraw theme
# pm + ggplot2::theme_linedraw()
## change to custom theme
# pm + ggplot2::theme(panel.background = ggplot2::element_rect(fill = "lightblue"))
## add a list of information
extra <- list(ggplot2::theme_bw(), ggplot2::labs(caption = "My caption!"))
pm + extra



