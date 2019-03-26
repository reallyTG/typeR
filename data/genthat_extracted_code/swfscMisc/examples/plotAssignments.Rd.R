library(swfscMisc)


### Name: plotAssignments
### Title: Plot assignment distributions
### Aliases: plotAssignments

### ** Examples

n <- 40
probs <- abs(c(rnorm(n, 80, 10), rnorm(n, 20, 10)))
probs <- (probs - min(probs)) / max(probs)
probs <- cbind(probs, 1 - probs)
colnames(probs) <- NULL
orig <- rep(c("Group.1", "Group.2"), each = n)

plotAssignments(probs, orig)

n <- 15
probs <- abs(c(rnorm(n, 80, 10), rnorm(n, 20, 10)))
probs <- (probs - min(probs)) / max(probs)
probs <- cbind(probs, 1 - probs)
colnames(probs) <- NULL
orig <- rep(c("Group.1", "Group.2"), each = n)

plotAssignments(probs, orig)




