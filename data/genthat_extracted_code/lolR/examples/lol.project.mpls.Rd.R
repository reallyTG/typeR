library(lolR)


### Name: lol.project.mpls
### Title: Mean-Augmented Partial Least-Squares (MPLS)
### Aliases: lol.project.mpls

### ** Examples

library(lolR)
data <- lol.sims.rtrunk(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
model <- lol.project.mpls(X=X, Y=Y, r=5)  # use pls to project into 5 dimensions



