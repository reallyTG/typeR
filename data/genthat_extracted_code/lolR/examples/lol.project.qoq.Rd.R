library(lolR)


### Name: lol.project.qoq
### Title: Quadratic Optimal QDA (QOQ)
### Aliases: lol.project.qoq

### ** Examples

library(lolR)
data <- lol.sims.qdtoep(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
model <- lol.project.qoq(X=X, Y=Y, r=5)  # use qoq to project into 5 dimensions



