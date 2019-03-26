library(aplore3)


### Name: glow500
### Title: GLOW500 data
### Aliases: glow500
### Keywords: datasets

### ** Examples

head(glow500, n = 10)
summary(glow500)

## Table 2.2 p. 39
summary(mod2.2 <- glm(fracture ~ age + weight + priorfrac +
                                 premeno + raterisk,
                      family = binomial,
                      data = glow500))

## Table 2.3 p. 40
summary(mod2.3 <- update(mod2.2, . ~ . - weight - premeno))

## Table 2.4 p. 44
vcov(mod2.3)

## Table 3.6 p. 58
contrasts(glow500$raterisk)

## Contrasts: Table 3.8 and 3.9 p. 60
contrasts(glow500$raterisk) <- matrix(c(-1,-1,1,0,0,1), byrow= TRUE, ncol = 2)
summary(mod3.9 <- glm(fracture ~ raterisk, family = binomial,
                      data = glow500))
# cleaning modified dataset ...
rm(glow500)

## Table 5.1 pg 160 - Hosmer-Lemeshow test (with vcdExtra package)
mod4.16 <- glm(fracture ~ age * priorfrac + height + momfrac * armassist +
                          I(as.integer(raterisk) == 3) ,
               family = binomial,
               data = glow500)
library(vcdExtra)
summary(HLtest(mod4.16))

## Table 5.3 p. 171 - Classification table
glow500$pred4.16 <- predict(mod4.16, type = "response")
with(glow500, addmargins(table( pred4.16 > 0.5, fracture)))

## Sensitivy, specificity, ROC (using pROC)
library(pROC)

## Figure 5.3 p. 177 - ROC curve (using pROC package)
print(roc4.16 <- roc(fracture ~ pred4.16, data = glow500))
plot(roc4.16, main = "Figure 5.3 p. 177")

## Table 5.8 p. 175
vars <- c("thresholds","sensitivities","specificities")
tab5.8 <- data.frame(roc4.16[vars])
## Now, for printing/comparison purposes, steps below in order to find
## threshold values most similar to those in the table
findIndex <- function(x, y) which.min( (x-y)^2 )
cutPoints <- seq(0.05, 0.75, by = 0.05)
tableIndex <- mapply(findIndex, y = cutPoints,
                     MoreArgs = list(x = roc4.16$thresholds))
## And finally, let's print a reasonable approximation of table 5.8
writeLines("\nTable 5.8 p. 175\n")
tab5.8[tableIndex, ]

## Figure 5.1 p. 175
plot(specificities ~ thresholds, xlim = c(0, 1), type = "l",
     xlab = "Probabilty cutoff", ylab = "Sensitivity/specificity",
     ylim = c(0, 1), data = tab5.8, main = "Figure 5.1 p. 175")
with(tab5.8, lines(thresholds, sensitivities, col = "red"))
legend(x = 0.75, y = 0.55, legend = c("Sensitivity", "Specificity"),
       lty = 1, col = c("red","black"))
abline(h = c(0, 1), col = "grey80", lty = "dotted")



