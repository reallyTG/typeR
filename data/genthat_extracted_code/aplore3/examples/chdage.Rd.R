library(aplore3)


### Name: chdage
### Title: CHDAGE data
### Aliases: chdage
### Keywords: datasets

### ** Examples

head(chdage,  n = 10)
summary(chdage)

## Figure 1.1 p. 5
plot(as.integer(chd)-1 ~ age,
     pch = 20,
     main = "Figure 1.1 p. 5",
     ylab = "Coronary heart disease",
     xlab = "Age (years)",
     data = chdage)

## Table 1.2
with(chdage, addmargins(table(agegrp)))
with(chdage, addmargins(table(agegrp, chd)))
(Means <- with(chdage, tapply(as.integer(chd)-1, list(agegrp), mean)))

## Figure 1.2 p. 6
midPoints <- c(24.5, seq(32, 57, 5), 64.5)
plot(midPoints, Means, pch = 20,
     ylab = "Coronary heart disease (mean)",
     xlab = "Age (years)", ylim = 0:1,
     main = "Figure 1.2 p. 6")
lines(midPoints, Means)

## Table 1.3
summary( mod1.3 <- glm( chd ~ age, family = binomial, data = chdage ))

## Table 1.4
vcov(mod1.3)

## Computing OddsRatio and confidence intervals for age ...
exp(coef(mod1.3))[-1]
exp(confint(mod1.3))[-1, ]



