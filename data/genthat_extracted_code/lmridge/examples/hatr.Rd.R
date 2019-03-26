library(lmridge)


### Name: hatr.lmridge
### Title: Ridge Regression: Hat Matrix
### Aliases: hatr hatr.lmridge
### Keywords: ridge regression ridge hat matrix

### ** Examples

mod <- lmridge(y~., as.data.frame(Hald), K = c(0, 0.1, 0.2, 0.3))
## Hat matrix for each biasing parameter
hatr(mod)

## Hat matrix for first biasing parameter i.e. K = 0.1
hatr(mod)[[2]]



