library(DAAG)


### Name: carprice
### Title: US Car Price Data
### Aliases: carprice
### Keywords: datasets

### ** Examples
 
print("Multicollinearity - Example 6.8")
pairs(carprice[,-c(1,8,9)])

carprice1.lm <- lm(gpm100 ~ Type+Min.Price+Price+Max.Price+Range.Price,
    data=carprice)
round(summary(carprice1.lm)$coef,3)
pause()

alias(carprice1.lm)
pause()

carprice2.lm <- lm(gpm100 ~ Type+Min.Price+Price+Max.Price+RoughRange, data=carprice)
round(summary(carprice2.lm)$coef, 2)
pause()

carprice.lm <- lm(gpm100 ~ Type + Price, data = carprice)
round(summary(carprice.lm)$coef,4)  
pause()

summary(carprice1.lm)$sigma   # residual standard error when fitting all 3 price variables
pause()

summary(carprice.lm)$sigma    # residual standard error when only price is used
pause()

vif(lm(gpm100 ~ Price, data=carprice)) # Baseline Price
pause()

vif(carprice1.lm)    # includes Min.Price, Price & Max.Price
pause()

vif(carprice2.lm)    # includes Min.Price, Price, Max.Price & RoughRange
pause()

vif(carprice.lm)     # Price alone



