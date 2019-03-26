library(highcharter)


### Name: hcspark
### Title: Shortcut to make spkarlines
### Aliases: hcspark

### ** Examples


set.seed(123)
x <- cumsum(rnorm(10))

hcspark(x) 
hcspark(x, "columnn")
hcspark(c(1, 4, 5), "pie")
hcspark(x, type = "area")
   



