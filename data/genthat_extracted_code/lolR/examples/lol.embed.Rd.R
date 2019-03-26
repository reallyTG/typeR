library(lolR)


### Name: lol.embed
### Title: Embedding
### Aliases: lol.embed

### ** Examples

library(lolR)
data <- lol.sims.rtrunk(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
model <- lol.project.lol(X=X, Y=Y, r=5)  # use lol to project into 5 dimensions
Xr <- lol.embed(X, model$A)



