library(highcharter)


### Name: hcparcords
### Title: Shortcut for create parallel coordinates
### Aliases: hcparcords

### ** Examples

require(viridisLite)

n <- 15

hcparcords(head(mtcars, n), color = hex_to_rgba(magma(n), 0.5))

require(dplyr)
data(iris)
set.seed(123)

iris <- sample_n(iris, 60)

hcparcords(iris, color = colorize(iris$Species))



