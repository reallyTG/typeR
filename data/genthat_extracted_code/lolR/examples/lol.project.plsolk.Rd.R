library(lolR)


### Name: lol.project.plsolk
### Title: Partial Least Squares Optimal Low-Rank Projection K (PLSOLK)
### Aliases: lol.project.plsolk

### ** Examples

library(lolR)
data <- lol.sims.rtrunk(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
model <- lol.project.plsolk(X=X, Y=Y, r=5)  # use lol to project into 5 dimensions



