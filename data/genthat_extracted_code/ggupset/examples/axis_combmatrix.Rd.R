library(ggupset)


### Name: axis_combmatrix
### Title: Convert delimited text labels into a combination matrix axis
### Aliases: axis_combmatrix

### ** Examples

  library(ggplot2)
  mtcars$combined <- paste0("Cyl: ", mtcars$cyl, "_Gears: ", mtcars$gear)
  head(mtcars)
  ggplot(mtcars, aes(x=combined)) +
    geom_bar() +
    axis_combmatrix(sep = "_")




