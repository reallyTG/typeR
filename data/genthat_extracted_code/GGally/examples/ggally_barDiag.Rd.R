library(GGally)


### Name: ggally_barDiag
### Title: Plots the Bar Plots by Using Diagonal
### Aliases: ggally_barDiag
### Keywords: hplot

### ** Examples

data(tips, package = "reshape")
ggally_barDiag(tips, mapping = ggplot2::aes(x = day))
ggally_barDiag(tips, mapping = ggplot2::aes(x = tip), binwidth = 0.25)



