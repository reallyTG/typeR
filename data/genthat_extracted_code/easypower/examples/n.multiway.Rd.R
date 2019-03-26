library(easypower)


### Name: n.multiway
### Title: Sample size calculations for factorial ANOVAs
### Aliases: n.multiway

### ** Examples

# Exercise 8.15, p.400 from Cohen (1988)
# Defining the treatments
main.eff.1 <- list(name = "R", levels = 2, eta.sq = 0.123)
main.eff.2 <- list(name = "C", levels = 4, eta.sq = 0.215)
# Running n.multiway
n.multiway(iv1=main.eff.1, iv2=main.eff.2, interaction.eta2 = 0.079)
# To just view highest
n.multiway(iv1=main.eff.1, iv2=main.eff.2, interaction.eta2 = 0.079, result = "highest")

# Exercise 8.14, p.397 from Cohen (1988)
# Defining the treatments and interaction
main.eff.1 <- list(name = "Sex", levels = 2, eta.sq = 0.0099)
main.eff.2 <- list(name = "Age", levels = 3, eta.sq = 0.0588)
main.eff.3 <- list(name = "Conditions", levels = 4, eta.sq = 0.1506)
# Running n.multiway
n.multiway(iv1=main.eff.1, iv2=main.eff.2, iv3=main.eff.3, interaction.eta2 = 0.0588)



