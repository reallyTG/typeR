library(productplots)


### Name: prodplot
### Title: Create a product plot
### Aliases: prodplot

### ** Examples

if (require("ggplot2")) {
prodplot(happy, ~ happy, "hbar")
prodplot(happy, ~ happy, "hspine")

prodplot(happy, ~ sex + happy, c("vspine", "hbar"))
prodplot(happy, ~ sex + happy, stacked())

prodplot(happy, ~ happy + sex | health, mosaic("h")) + aes(fill=happy)
# The levels argument can be used to extract a given level of the plot
prodplot(happy, ~ sex + happy, stacked(), level = 1)
prodplot(happy, ~ sex + happy, stacked(), level = 2)
}



