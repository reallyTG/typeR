library(lmridge)


### Name: cv.plot
### Title: Ridge CV and GCV Plot
### Aliases: cv.plot
### Keywords: ridge cross validation criteria ridge CV ridge GCV

### ** Examples

mod <- lmridge(y~., as.data.frame(Hald), K = seq(0, 0.2, 0.002))
## for indication vertical line (biasing parameter k) and
## horizontal line (minimum respective CV and GCV values corresponding to vertical line)
cv.plot(mod)

## without Horizontal and vertical line set \code{abline = FALSE}
cv.plot(mod, abline = FALSE)



