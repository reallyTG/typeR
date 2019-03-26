library(lmridge)


### Name: bias.plot
### Title: Bias Variance and MSE Trade-off Plot
### Aliases: bias.plot
### Keywords: ridge MSE ridge bias ridge variance

### ** Examples

mod <- lmridge(y~., as.data.frame(Hald), K = seq(0, 0.3, 0.002))
## for indication vertical line (biasing parameter k) and
## horizontal line (minimum minimum ridge MSE values corresponding to vertical line)
bias.plot(mod)

## without Horizontal and vertical line as set \code{abline = FALSE}
bias.plot(mod, abline=FALSE)



