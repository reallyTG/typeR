library(DAAG)


### Name: anesthetic
### Title: Anesthetic Effectiveness
### Aliases: anesthetic
### Keywords: datasets

### ** Examples

print("Logistic Regression - Example 8.1.4")

z <- table(anesthetic$nomove, anesthetic$conc)
tot <- apply(z, 2, sum)         # totals at each concentration
prop <- z[2,  ]/(tot)           # proportions at each concentration
oprop <- sum(z[2,  ])/sum(tot)  # expected proportion moving if concentration had no effect
conc <- as.numeric(dimnames(z)[[2]])
plot(conc, prop, xlab = "Concentration", ylab = "Proportion", xlim = c(.5,2.5),
    ylim = c(0, 1), pch = 16)
chw <- par()$cxy[1]
text(conc - 0.75 * chw, prop, paste(tot), adj = 1)
abline(h = oprop, lty = 2)

pause()

anes.logit <- glm(nomove ~ conc, family = binomial(link = logit),
  data = anesthetic)
anova(anes.logit)
summary(anes.logit)




