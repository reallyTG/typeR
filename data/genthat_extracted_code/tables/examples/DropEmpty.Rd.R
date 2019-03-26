library(tables)


### Name: DropEmpty
### Title: 'DropEmpty' pseudo-function
### Aliases: DropEmpty

### ** Examples

df <- data.frame(row = factor(1:10), value = rnorm(10))
subset <- df[sample(10, 5),, drop = FALSE]

# Some rows did not get selected, so this looks ugly
tabular(row ~ value*mean, data = subset)

# This only shows rows with data in them
tabular(row*DropEmpty() ~ value*mean, data = subset)

# This shows empty cells as "(empty)"
tabular(row*DropEmpty("(empty)", "cell") ~ value*mean, data = subset)



