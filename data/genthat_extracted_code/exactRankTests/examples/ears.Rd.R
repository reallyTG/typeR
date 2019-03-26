library(exactRankTests)


### Name: ears
### Title: Survival of Ventilating Tubes
### Aliases: ears
### Keywords: datasets

### ** Examples

data(ears)
if (require(survival, quietly=TRUE)) {
  ls <- cscores(Surv(ears$left, ears$lcens), int=TRUE)
  perm.test(ls ~ group, data=ears)
}




