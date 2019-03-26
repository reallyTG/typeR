library(GGally)


### Name: ggmatrix_progress
### Title: ggmatrix default progress bar
### Aliases: ggmatrix_progress

### ** Examples

p_ <- GGally::print_if_interactive

pm <- ggpairs(iris, 1:2, progress = ggmatrix_progress())
p_(pm)

# does not clear after finishing
pm <- ggpairs(iris, 1:2, progress = ggmatrix_progress(clear = FALSE))
p_(pm)



