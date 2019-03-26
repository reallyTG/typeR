library(rmonad)


### Name: print.Rmonad
### Title: Rmonad print generic function
### Aliases: print.Rmonad

### ** Examples

m1 <- 256 %v>% sqrt %>>% sqrt %>>% sqrt
print(m1)
print(m1, verbose=TRUE)



