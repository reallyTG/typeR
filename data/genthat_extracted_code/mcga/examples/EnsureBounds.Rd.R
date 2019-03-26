library(mcga)


### Name: EnsureBounds
### Title: Altering vector of doubles to satisfy boundary constraints
### Aliases: EnsureBounds

### ** Examples

set.seed(1234)
x <- runif(10)
print(x)
# [1] 0.113703411 0.622299405 0.609274733 0.623379442 0.860915384 0.640310605
# [7] 0.009495756 0.232550506 0.666083758 0.514251141
EnsureBounds(x, mins=rep(0,10), maxs=rep(0.2,10))
print(x)
# [1] 0.113703411 0.138718258 0.108994967 0.056546717 0.184686697 0.058463168
# [7] 0.009495756 0.167459126 0.057244657 0.053364156



