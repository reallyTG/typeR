library(lmridge)


### Name: kest.lmridge
### Title: Computation of Ridge Biasing Parameter K
### Aliases: kest kest.lmridge print.klmridge
### Keywords: ridge biasing parameter

### ** Examples

mod <- lmridge(y~., as.data.frame(Hald), K = seq(0, 0.2, 0.001))
kest(mod)

## GCV values
kest(mod)$GCV

## minimum GCV value
kest(mod)$kGCV

## Hoerl and Kennard (1970)
kest(mod)$HKB




