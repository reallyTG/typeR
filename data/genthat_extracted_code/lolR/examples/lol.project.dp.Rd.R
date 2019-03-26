library(lolR)


### Name: lol.project.dp
### Title: Data Piling
### Aliases: lol.project.dp

### ** Examples

library(lolR)
data <- lol.sims.rtrunk(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
model <- lol.project.dp(X=X, Y=Y)  # use mdp to project into maximal data piling



