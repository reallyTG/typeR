library(MSnbase)


### Name: reduce,data.frame-method
### Title: Reduce a data.frame
### Aliases: reduce,data.frame-method

### ** Examples

dfr <- data.frame(A = c(1, 1, 2),
                  B = c("x", "x", "z"),
                  C = LETTERS[1:3])
dfr
dfr2 <- reduce(dfr, key = "A")
dfr2
## column A used as key is still num
str(dfr2)
dfr3 <- reduce(dfr, key = "B")
dfr3
## A is converted to chr; B remains factor
str(dfr3)
dfr4 <- data.frame(A = 1:3,
                   B = LETTERS[1:3],
                   C = c(TRUE, FALSE, NA))
## No effect of reducing, column classes are maintained
str(reduce(dfr4, key = "B"))



