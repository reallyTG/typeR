library(BayesTreePrior)


### Name: NumBotMaxDepthX
### Title: Number of bottom nodes and depth in the general case (Case #4).
### Aliases: NumBotMaxDepthX

### ** Examples

if (requireNamespace("MASS", quietly = TRUE)) {
    x1 = MASS::mcycle$times
    x1[sample(1:length(x1), 20)] <- NA
    x2= MASS::mcycle$accel
    x2[sample(1:length(x2), 20)] <- NA
    X = cbind(x1, x2)
    results1 = NumBotMaxDepthX(.95,.5, data.frame(X), minpart=5)
    X_dummies = is.na(X) + 0
    results2 = NumBotMaxDepthX(.95,.5, data.frame(cbind(X,X_dummies)), minpart=5, MIA=TRUE, 
    missingdummy=TRUE)
}



