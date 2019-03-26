library(Momocs)


### Name: plot_table
### Title: Plots confusion matrix of sample sizes within $fac
### Aliases: plot_table

### ** Examples

plot_table(olea, "var")
plot_table(olea, "domes", "var")
gg <- plot_table(olea, "domes", "var", rm0 = TRUE)
gg
library(ggplot2)
gg + coord_equal()
gg + scale_fill_gradient(low="green", high = "red")
gg + coord_flip()



