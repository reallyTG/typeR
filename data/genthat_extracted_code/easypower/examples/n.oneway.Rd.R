library(easypower)


### Name: n.oneway
### Title: Calculates the required sample size for a one-way ANOVA.
### Aliases: n.oneway

### ** Examples

# Exercise 8.10, p.391 from Cohen (1988)
main.eff <- list(name = "Teaching", levels = 4, eta.sq = 0.0588)
# Running the function with default settings
n.oneway(iv = main.eff)



