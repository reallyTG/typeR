library(ggasym)


### Name: organize_levels
### Title: Decides on the levels of factors x and y
### Aliases: organize_levels

### ** Examples

set.seed(0)
a <- factor(sample(LETTERS, 5), levels = LETTERS)
b <- factor(sample(LETTERS, 5), levels = LETTERS)

a

b

organize_levels(a, b)




