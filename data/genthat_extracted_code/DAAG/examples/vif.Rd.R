library(DAAG)


### Name: vif
### Title: Variance Inflation Factors
### Aliases: vif
### Keywords: models

### ** Examples

litters.lm <- lm(brainwt ~ bodywt + lsize, data = litters)
vif(litters.lm)

carprice1.lm <- lm(gpm100 ~ Type+Min.Price+Price+Max.Price+Range.Price,
    data=carprice)
vif(carprice1.lm)

carprice.lm <- lm(gpm100 ~ Type + Price, data = carprice)
vif(carprice1.lm)




