library(lolR)


### Name: lol.xval.split
### Title: Cross-Validation Data Splitter
### Aliases: lol.xval.split

### ** Examples

# prepare data for 10-fold validation
library(lolR)
data <- lol.sims.rtrunk(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
sets.xval.10fold <- lol.xval.split(X, Y, k=10)

# prepare data for loo validation
sets.xval.loo <- lol.xval.split(X, Y, k='loo')




