library(hint)


### Name: hint.test
### Title: A Hypergeometric Intersection Test
### Aliases: hint.test
### Keywords: distribution htest

### ** Examples

## Build data input:
dd <- data.frame(letters[1:20], rep(1,20), rep(1,20))
hint.test(dd, letters[1:9], letters[4:14], alternative = "greater")

dd <- data.frame(letters[1:20], rep(1,20), c(rep(1,4),rep(2,16)))
hint.test(dd, letters[1:9], letters[4:14], alternative = "less")




