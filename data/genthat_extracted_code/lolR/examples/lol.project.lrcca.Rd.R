library(lolR)


### Name: lol.project.lrcca
### Title: Low-rank Canonical Correlation Analysis (LR-CCA)
### Aliases: lol.project.lrcca

### ** Examples

library(lolR)
data <- lol.sims.rtrunk(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
model <- lol.project.lrcca(X=X, Y=Y, r=5)  # use lrcca to project into 5 dimensions



