library(lasso2)


### Name: Prostate
### Title: Prostate Cancer Data
### Aliases: Prostate
### Keywords: datasets

### ** Examples

data(Prostate)
attach(Prostate)
pairs(Prostate, col = 1+svi, pch = gleason - 5,
      main = paste("Prostate data, n = ", nrow(Prostate)))
detach()

l1c.P <- l1ce(lcavol ~ ., data = Prostate)
coef(l1c.P)[coef(l1c.P) != 0] ## only age, lcp, lpsa (+ intercept)
summary(l1c.P)



