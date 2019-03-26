library(mpoly)


### Name: reorder.mpoly
### Title: Reorder a multivariate polynomial.
### Aliases: reorder.mpoly

### ** Examples


list <- list(
  c(x = 1, y = 2, z = 1, coef = 1),
  c(x = 2, y = 0, z = 2, coef = 1),
  c(x = 0, y = 0, z = 2, coef = 1),
  c(x = 3, y = 0, z = 0, coef = 1)
)
(p <- mpoly(list)) # -> x y^2 z  +  x^2 z^2  +  z^2  +  x^3
reorder(p) # -> x y^2 z  +  x^2 z^2  +  z^2  +  x^3
reorder(p, varorder = c("x","y","z"), order = "lex")
    # -> x^3  +  x^2 z^2  +  x y^2 z  +  z^2
reorder(p, varorder = c("x","y","z"), order = "glex")
    # -> x^2 z^2  +  x y^2 z  +  x^3  +  z^2
reorder(p, varorder = c("x","y","z"), order = "grlex")
    # -> x y^2 z  +  x^2 z^2  +  x^3  +  z^2

reorder(mp("x + 1"), varorder = c("y","x","z"), order = "lex")
reorder(mp("x + y"), varorder = c("y","x","z"), order = "lex")
reorder(mp("x y + y + 2 x y z^2"), varorder = c("y","x","z"))
reorder(mp("x^2 + y x + y"), order = "lex")





