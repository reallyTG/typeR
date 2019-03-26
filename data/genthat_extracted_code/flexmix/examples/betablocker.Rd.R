library(flexmix)


### Name: betablocker
### Title: Clinical Trial of Beta-Blockers
### Aliases: betablocker
### Keywords: datasets

### ** Examples

data("betablocker", package = "flexmix")
betaMix <- initFlexmix(cbind(Deaths, Total - Deaths) ~ 1 | Center,
                       data = betablocker, k = 3, nrep = 5,
                       model = FLXMRglmfix(family = "binomial",
                         fixed = ~Treatment)) 



