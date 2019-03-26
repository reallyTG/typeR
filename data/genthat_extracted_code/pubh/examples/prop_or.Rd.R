library(pubh)


### Name: prop_or
### Title: Proportion, p1 from proportion p2 and OR.
### Aliases: prop_or

### ** Examples

flu <- matrix(c(20, 80, 220, 140), nrow = 2)
colnames(flu) <- c("Yes", "No")
rownames(flu) <- c("Vaccine", "Placebo")
flu

or <- (20 * 140) / (80 * 220)
p2 <- 80 / 220
prop_or(p2 = p2, or = or)
20 / 240



