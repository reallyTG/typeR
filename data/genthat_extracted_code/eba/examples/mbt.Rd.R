library(eba)


### Name: mbt
### Title: Mallows-Bradley-Terry Model
### Aliases: mbt print.mbt
### Keywords: models

### ** Examples

data(tartness)        # tartness rankings of salad dressings (Vargo, 1989)
mbt(tartness, bootstrap=TRUE, nsim=500)  # fit Mallows-Bradley-Terry model



