library(hint)


### Name: print.hint.test
### Title: Print a Summary of a hint.test Object
### Aliases: print.hint.test

### ** Examples

## Build test object.
dd <- data.frame(letters[1:20], rep(1,10), rep(1,10))
tt <- hint.test(dd, letters[1:9], letters[7:15], alternative = "greater")

## Print summary:
print(tt)




