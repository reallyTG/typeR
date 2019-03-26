library(lolR)


### Name: lol.project.rp
### Title: Random Projections (RP)
### Aliases: lol.project.rp

### ** Examples

library(lolR)
data <- lol.sims.rtrunk(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
model <- lol.project.rp(X=X, r=5)  # use lol to project into 5 dimensions



