library(Stack)


### Name: Stack
### Title: Stack Combine data frames with column names that do not
###   completely intersect
### Aliases: Stack

### ** Examples

testdf1 <- data.frame(both.int=1:4,
                      expand.factor=c("blue", "yellow"),
                      mixed.fac.int=factor(letters[1:4]),
                      date=as.Date("1983-11-22"),
                      df1only=rep(1:2, each=2),
                      mixed.fac.chr=I(c("a","b","NA",NA)))
testdf2 <- data.frame(both.int=5:24,
                      expand.factor=factor(rep(c(1:4, NA), 4)),
                      mixed.fac.int=1:4,
                      date=as.Date("1981-09-24"),
                      df2only=factor(c("c", "d")),
                      mixed.fac.chr=c("a","b",NA,"c"))

levels(testdf2$mixed.fac.chr) <- letters #overleveled
## put levels in a different order than sort(levels) would do, but
## don't make it an ordered factor. Result needs to be ordered
## to preserve this.
levels(testdf2$expand.factor) <- c("green", "blue", "red", "yellow")
Stack(testdf1, testdf2)
Stack(testdf2, testdf1)



