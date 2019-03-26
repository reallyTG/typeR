library(vcd)


### Name: WeldonDice
### Title: Weldon's Dice Data
### Aliases: WeldonDice
### Keywords: datasets

### ** Examples

data("WeldonDice")
gf <- goodfit(WeldonDice, type = "binomial")
summary(gf)
plot(gf)



