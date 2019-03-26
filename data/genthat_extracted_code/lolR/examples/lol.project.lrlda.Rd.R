library(lolR)


### Name: lol.project.lrlda
### Title: Low-Rank Linear Discriminant Analysis (LRLDA)
### Aliases: lol.project.lrlda

### ** Examples

library(lolR)
data <- lol.sims.rtrunk(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
model <- lol.project.lrlda(X=X, Y=Y, r=2)  # use cpca to project into 2 dimensions



