library(kutils)


### Name: truncsmart
### Title: Cuts a string at a specified linewidth, trying to align cut with
###   a separator
### Aliases: truncsmart

### ** Examples

x <- "Aasdf asdIasdf fW_asd asd aasjdf_as fasdasdfasdfasd"
truncsmart(x, target = 10, tol = c(5, 2))
truncsmart(x, target = 10, tol = c(1, 4))
truncsmart(x, target = 10, tol = c(5, 2), capwidth = 1.2)
truncsmart(x, target = 20, tol = c(5, 2))
truncsmart(x, target = 20, tol = c(10,10), capwidth = 2)
truncsmart(x, target = 20, tol = c(10,10), capwidth = 3)
truncsmart(x, target = 20, tol = c(10,10), capwidth = 4)
truncsmart(x, target = 20, tol = c(10,10), capwidth = 6)



