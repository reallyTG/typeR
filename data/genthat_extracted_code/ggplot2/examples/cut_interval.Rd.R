library(ggplot2)


### Name: cut_interval
### Title: Discretise numeric data into categorical
### Aliases: cut_interval cut_number cut_width

### ** Examples

table(cut_interval(1:100, 10))
table(cut_interval(1:100, 11))

table(cut_number(runif(1000), 10))

table(cut_width(runif(1000), 0.1))
table(cut_width(runif(1000), 0.1, boundary = 0))
table(cut_width(runif(1000), 0.1, center = 0))



