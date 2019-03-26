library(ClustOfVar)


### Name: predict.clustvar
### Title: Scores of new objects on the synthetic variables of a given
###   partition
### Aliases: predict.clustvar

### ** Examples

data(wine)
n <- nrow(wine)
sub <- 10:20
data.sub <- wine[sub,] #learning sample
X.quanti <- wine[sub,c(3:29)] #learning sample
X.quali <- wine[sub,c(1,2)]
part <-kmeansvar(X.quanti, X.quali, init=5)
X.quanti.t <- wine[-sub,c(3:29)]
X.quali.t <- wine[-sub,c(1,2)]
new <- predict(part,X.quanti.t,X.quali.t)



