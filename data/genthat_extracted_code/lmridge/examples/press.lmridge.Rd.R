library(lmridge)


### Name: press.lmridge
### Title: Predicted Residual Sum of Squares
### Aliases: press.lmridge press
### Keywords: ridge PRESS

### ** Examples

mod <- lmridge(y~., as.data.frame(Hald), K = seq(0, 0.5, 0.04))
press(mod)



