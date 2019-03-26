library(abd)


### Name: Zooplankton
### Title: Zooplankton Depredation
### Aliases: Zooplankton
### Keywords: datasets

### ** Examples

Zooplankton

Zooplankton$block <- factor(Zooplankton$block)
str(Zooplankton)

aov.fit <- aov(zooplankton ~ block + treatment,
  data = Zooplankton)
summary(aov.fit)



