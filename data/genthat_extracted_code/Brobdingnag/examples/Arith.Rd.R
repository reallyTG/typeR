library(Brobdingnag)


### Name: Arith-methods
### Title: Methods for Function Arith in package Brobdingnag
### Aliases: Arith-methods Arith,brob,missing-method Arith,brob,ANY-method
###   Arith,brob,brob-method Arith,brob,complex-method
###   Arith,ANY,brob-method Arith,ANY,glub-method Arith,glub,missing-method
###   Arith,glub,glub-method Arith,glub,ANY-method
###   Arith,glub,complex-method Arith,complex,brob-method
###   Arith,complex,glub-method Arith,brob,glub-method
###   Arith,glub,brob-method
### Keywords: methods math

### ** Examples

x <- as.brob(1:10)
y <- 1e10

x+y

as.numeric((x+y)-1e10)

x^(1/y)






