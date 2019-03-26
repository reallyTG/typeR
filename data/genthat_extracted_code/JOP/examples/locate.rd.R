library(JOP)


### Name: locate
### Title: Selection of a compromise
### Aliases: locate

### ** Examples

# Example: Sheet metal hydroforming process
outtest <- JOP(datax = datax, datay = datay, tau = list(0, 0.05), numbW = 5)

# Location of points
locate(outtest, xlu = c(3, 4))



