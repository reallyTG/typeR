library(GGally)


### Name: ggally_densityDiag
### Title: Plots the Density Plots by Using Diagonal
### Aliases: ggally_densityDiag
### Keywords: hplot

### ** Examples

 data(tips, package = "reshape")
 ggally_densityDiag(tips, mapping = ggplot2::aes(x = total_bill))
 ggally_densityDiag(tips, mapping = ggplot2::aes(x = total_bill, color = day))



