library(errors)


### Name: as.data.frame.errors
### Title: Coerce to a Data Frame
### Aliases: as.data.frame.errors

### ** Examples

x <- set_errors(1:3, 0.1)
y <- set_errors(4:6, 0.2)
(z <- cbind(x, y))
as.data.frame(z)




