library(psycho)


### Name: find_combinations.formula
### Title: Generate all combinations of predictors of a formula.
### Aliases: find_combinations.formula

### ** Examples

library(psycho)

f <- as.formula("Y ~ A + B + C + D")
f <- as.formula("Y ~ A + B + C + D + (1|E)")
f <- as.formula("Y ~ A + B + C + D + (1|E) + (1|F)")

find_combinations(f)



