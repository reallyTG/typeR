library(hint)


### Name: plot.hint.test
### Title: Plot hint.test Objects.
### Aliases: plot.hint.test
### Keywords: distribution htest

### ** Examples

## Build hint.test object:
dd <- data.frame(letters[1:20], rep(1,10), rep(1,10))
tt <- hint.test(dd, letters[1:9], letters[7:15], alternative = "greater")

## Plot the distribution with the test region highlighted in red.
plot(tt, col = "blue")




