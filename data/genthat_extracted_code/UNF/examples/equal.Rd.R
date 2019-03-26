library(UNF)


### Name: %unf%
### Title: Compare two objects
### Aliases: %unf% print.UNFtest unf_equal

### ** Examples

a <- data.frame(x1=1:10, x2=11:20)
b <- data.frame(x1=1:10, x2=11:20+.0005)
a %unf% a
a %unf% b
unf_equal(a, b, digits = 3)

unf(a) %unf% "UNF6:aKW4lAFNBH8vfrnrDbQZjg=="




