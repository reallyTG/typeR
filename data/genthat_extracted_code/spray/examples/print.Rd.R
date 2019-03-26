library(spray)


### Name: print.spray
### Title: Print methods for spray objects
### Aliases: print.spray print_spray_matrixform print_spray_polyform
### Keywords: symbolmath

### ** Examples


(a <- spray(diag(3)))


options(polyform = FALSE)
a^3

options(polyform = TRUE)
a^3


options(sprayvars=letters)
a <- diag(26)
spray(a)

## Following example from mpoly:
a[1 + cbind(0:25, 1:26) %% 26] <- 2
spray(a)






