library(tabplot)


### Name: num2fac
### Title: Transform a numerical vector to a factor
### Aliases: num2fac

### ** Examples

require(ggplot2)
data(diamonds)

diamonds$price2 <- num2fac(diamonds$price)

tableplot(diamonds)



