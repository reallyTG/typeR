library(gsynth)


### Name: gsynth
### Title: Generalized Synthetic Control Method
### Aliases: gsynth

### ** Examples

library(gsynth)
data(gsynth)
out <- gsynth(Y ~ D + X1 + X2, data = simdata, parallel = FALSE, 
              index = c("id","time"), force = "two-way",
              CV = TRUE, r = c(0, 5), se = FALSE) 
print(out) 



