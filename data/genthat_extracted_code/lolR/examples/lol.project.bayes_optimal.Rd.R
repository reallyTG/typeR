library(lolR)


### Name: lol.project.bayes_optimal
### Title: Bayes Optimal
### Aliases: lol.project.bayes_optimal

### ** Examples

library(lolR)
data <- lol.sims.rtrunk(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
# obtain bayes-optimal projection of the data
model <- lol.project.bayes_optimal(X=X, Y=Y, mus=data$mus,
                                   S=data$Sigmas, priors=data$priors)



