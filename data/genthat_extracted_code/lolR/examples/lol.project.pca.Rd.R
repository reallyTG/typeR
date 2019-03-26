library(lolR)


### Name: lol.project.pca
### Title: Principal Component Analysis (PCA)
### Aliases: lol.project.pca

### ** Examples

library(lolR)
data <- lol.sims.rtrunk(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
model <- lol.project.pca(X=X, r=2)  # use pca to project into 2 dimensions



