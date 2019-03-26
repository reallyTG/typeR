library(POT)


### Name: summary.pot
### Title: Compactly display the structure
### Aliases: summary.pot
### Keywords: models

### ** Examples

set.seed(123)
x <- rgpd(500, 0, 1, -0.15)
mle <- fitgpd(x, 0)
summary(mle)



