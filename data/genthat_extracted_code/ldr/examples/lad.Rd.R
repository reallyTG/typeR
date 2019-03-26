library(ldr)


### Name: lad
### Title: Likelihood Acquired Directions
### Aliases: lad

### ** Examples

data(flea)
fit <- lad(X=flea[,-1], y=flea[,1], numdir=2, numdir.test=TRUE)
summary(fit)
plot(fit)



