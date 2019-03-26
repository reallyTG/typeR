library(WRS2)


### Name: yuend
### Title: Paired samples robust t-tests.
### Aliases: yuend Dqcomhd
### Keywords: models

### ** Examples

## Cholesterol data from Wilcox (2012, p. 197)
before <- c(190, 210, 300,240, 280, 170, 280, 250, 240, 220)
after <- c(210, 210, 340, 190, 260, 180, 200, 220, 230, 200)
yuend(before, after)

set.seed(123)
Dqcomhd(before, after, nboot = 200, q = c(0.25, 0.5, 0.75))



