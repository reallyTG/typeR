library(AER)


### Name: Fertility
### Title: Fertility and Women's Labor Supply
### Aliases: Fertility Fertility2
### Keywords: datasets

### ** Examples

data("Fertility2")

## conflicts in ethnicity coding
ftable(xtabs(~ afam + hispanic + other, data = Fertility2))

## create convenience variables
Fertility2$mkids <- with(Fertility2, as.numeric(morekids) - 1)
Fertility2$samegender <- with(Fertility2, factor(gender1 == gender2))
Fertility2$twoboys <- with(Fertility2, factor(gender1 == "male" & gender2 == "male"))
Fertility2$twogirls <- with(Fertility2, factor(gender1 == "female" & gender2 == "female"))

## similar to Angrist and Evans, p. 462
fm1 <- lm(mkids ~ samegender, data = Fertility2)
summary(fm1)

fm2 <- lm(mkids ~ gender1 + gender2 + samegender + age + afam + hispanic + other, data = Fertility2)
summary(fm2)

fm3 <- lm(mkids ~ gender1 + twoboys + twogirls + age + afam + hispanic + other, data = Fertility2)
summary(fm3)



