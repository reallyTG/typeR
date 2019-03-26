library(restriktor)


### Name: restriktor-package
### Title: Package for equality and inequality restricted estimation and
###   hypothesis testing
### Aliases: restriktor-package

### ** Examples

## Data preparation
## Ages (in months) at which an infant starts to walk alone.
DATA <- ZelazoKolb1972
idx <- which(DATA$Group == "Control")
DATA <- DATA[-idx, ]

## unrestricted linear model 
fit.lm <- lm(Age ~ -1 + Group, data = DATA)
summary(fit.lm)

## restricted linear model with restriktions that the walking 
## exercises would not have a negative effect of increasing the 
## mean age at which a child starts to walk. 

myConstraints <- ' GroupActive  < GroupPassive; 
                   GroupPassive < GroupNo '
                   
fit.con <- restriktor(fit.lm, constraints = myConstraints)
summary(fit.con)




