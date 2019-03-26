library(liureg)


### Name: press.liu
### Title: Predicted Residual Sum of Squares
### Aliases: press.liu press
### Keywords: PRESS

### ** Examples

mod<-liu(y~., data = as.data.frame(Hald), d = seq(-5, 5, 0.1))
## PRESS
press(mod)

## Predicted residual
press(mod, predr = TRUE)



