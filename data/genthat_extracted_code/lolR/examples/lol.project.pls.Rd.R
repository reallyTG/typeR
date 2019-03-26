library(lolR)


### Name: lol.project.pls
### Title: Partial Least-Squares (PLS)
### Aliases: lol.project.pls

### ** Examples

library(lolR)
data <- lol.sims.rtrunk(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
model <- lol.project.pls(X=X, Y=Y, r=5)  # use pls to project into 5 dimensions



