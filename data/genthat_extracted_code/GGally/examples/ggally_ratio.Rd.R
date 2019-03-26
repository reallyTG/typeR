library(GGally)


### Name: ggally_ratio
### Title: Plots a mosaic plot
### Aliases: ggally_ratio
### Keywords: hplot

### ** Examples

data(tips, package = "reshape")
ggally_ratio(tips, ggplot2::aes(sex, day))
ggally_ratio(tips, ggplot2::aes(sex, day)) + ggplot2::coord_equal()
# only plot tiles greater or equal to 20 and scale to a max of 50
ggally_ratio(
  tips, ggplot2::aes(sex, day),
  floor = 20, ceiling = 50
) + ggplot2::theme(aspect.ratio = 4/2)



