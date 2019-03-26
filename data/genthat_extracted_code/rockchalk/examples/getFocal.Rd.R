library(rockchalk)


### Name: getFocal
### Title: Select focal values from an observed variable.
### Aliases: getFocal getFocal.default getFocal.factor getFocal.character

### ** Examples

x <- rnorm(100)
getFocal(x)
getFocal(x, xvals = "quantile")
getFocal(x, xvals = "quantile", n = 5)
getFocal(x, xvals = "std.dev")
getFocal(x, xvals = "std.dev", n = 5)
getFocal(x, xvals = c(-1000, 0.2, 0,5))
x <- factor(c("A","B","A","B","C","D","D","D"))
getFocal(x)
getFocal(x, n = 2)

x <- c("A","B","A","B","C","D","D","D")
getFocal(x)
getFocal(x, n = 2)




