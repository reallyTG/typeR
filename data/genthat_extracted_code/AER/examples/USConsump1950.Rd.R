library(AER)


### Name: USConsump1950
### Title: US Consumption Data (1940-1950)
### Aliases: USConsump1950
### Keywords: datasets

### ** Examples

## Greene (2003)
## data
data("USConsump1950")
usc <- as.data.frame(USConsump1950)
usc$war <- factor(usc$war, labels = c("no", "yes"))

## Example 2.1
plot(expenditure ~ income, data = usc, type = "n", xlim = c(225, 375), ylim = c(225, 350))
with(usc, text(income, expenditure, time(USConsump1950)))

## single model
fm <- lm(expenditure ~ income, data = usc)
summary(fm)

## different intercepts for war yes/no
fm2 <- lm(expenditure ~ income + war, data = usc)
summary(fm2)

## compare
anova(fm, fm2)

## visualize
abline(fm, lty = 3)                                   
abline(coef(fm2)[1:2])                                
abline(sum(coef(fm2)[c(1, 3)]), coef(fm2)[2], lty = 2)

## Example 3.2
summary(fm)$r.squared
summary(lm(expenditure ~ income, data = usc, subset = war == "no"))$r.squared
summary(fm2)$r.squared



