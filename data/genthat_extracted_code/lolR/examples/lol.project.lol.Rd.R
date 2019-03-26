library(lolR)


### Name: lol.project.lol
### Title: Linear Optimal Low-Rank Projection (LOL)
### Aliases: lol.project.lol

### ** Examples

library(lolR)
data <- lol.sims.rtrunk(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
model <- lol.project.lol(X=X, Y=Y, r=5)  # use lol to project into 5 dimensions



