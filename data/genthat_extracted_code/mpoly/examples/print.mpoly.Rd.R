library(mpoly)


### Name: print.mpoly
### Title: Pretty printing of multivariate polynomials.
### Aliases: print.mpoly

### ** Examples

p <- mp("2 x^5  -  3 y^2  +  x y^3")
p
print(p) # same
print(p, silent = TRUE)
s <- print(p, silent = TRUE)
s

print(p, order = "lex") # -> 2 x^5  +  x y^3  -  3 y^2
print(p, order = "lex", varorder = c("y","x")) # -> y^3 x  -  3 y^2  +  2 x^5
print(p, varorder = c("y","x")) # -> 2 x^5  -  3 y^2  +  y^3 x

print(p, stars = TRUE)




