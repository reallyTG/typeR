library(mvp)


### Name: horner
### Title: Horner's method
### Aliases: horner
### Keywords: symbolmath

### ** Examples

horner("x",1:5)
horner("x+y",1:3)

"x+y+x*y" %>% horner(1:3) %>% horner(1:2)



