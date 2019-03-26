library(ICGE)


### Name: chowdary
### Title: Chowdary Database
### Aliases: chowdary
### Keywords: datasets

### ** Examples

data(chowdary)

tumor <- as.factor(as.matrix(chowdary[1,]))
x <- as.matrix(chowdary[-1,])
mode(x) <- "numeric"

s <- sample(row.names(x),1)
boxplot( x[s,] ~ tumor , ylab=s)



