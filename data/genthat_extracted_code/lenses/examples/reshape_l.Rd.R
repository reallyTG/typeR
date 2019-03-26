library(lenses)


### Name: reshape_l
### Title: Lens into a new dimension(s)
### Aliases: reshape_l

### ** Examples

x <- 1:9
view(x, reshape_l(c(3,3)))
set(x, reshape_l(c(3,3)) %.% diag_l, 100)



