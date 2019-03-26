library(games)


### Name: makeFormulas
### Title: Model formula construction
### Aliases: makeFormulas

### ** Examples

## Not run: 
##D R> f1 <- makeFormulas(egame122, outcomes = c("budget cuts passed",
##D "budget cuts vetoed", "budget increase passed", "budget increase vetoed"))
##D 
##D ---
##D Equation for player 1's utility from budget cuts passed: 
##D 
##D 1: fix to 0
##D 2: intercept only
##D 3: regressors, no intercept
##D 4: regressors with intercept
##D 
##D Selection: 4
##D 
##D Enter variable names (separated by spaces):
##D legparty growth
##D 
##D ---
##D Equation for player 1's utility from budget cuts vetoed: 
##D 
##D 1: fix to 0
##D 2: intercept only
##D 3: regressors, no intercept
##D 4: regressors with intercept
##D 
##D Selection: 2
##D 
##D ---
##D Equation for player 1's utility from budget increase passed: 
##D 
##D 1: fix to 0
##D 2: intercept only
##D 3: regressors, no intercept
##D 4: regressors with intercept
##D 
##D Selection: 4
##D 
##D Enter variable names (separated by spaces):
##D legparty growth
##D 
##D ---
##D Equation for player 1's utility from budget increase vetoed: 
##D 
##D 1: fix to 0
##D 2: regressors, no intercept
##D 
##D Selection: 1
##D 
##D ---
##D Equation for player 2's utility from budget cuts vetoed: 
##D 
##D 1: fix to 0
##D 2: intercept only
##D 3: regressors, no intercept
##D 4: regressors with intercept
##D 
##D Selection: 4
##D 
##D Enter variable names (separated by spaces):
##D presparty growth
##D 
##D ---
##D Equation for player 2's utility from budget increase vetoed: 
##D 
##D 1: fix to 0
##D 2: intercept only
##D 3: regressors, no intercept
##D 4: regressors with intercept
##D 
##D Selection: 4
##D 
##D Enter variable names (separated by spaces):
##D presparty growth
##D 
##D ---
##D What is the name of the dependent variable in the dataset? (If stored as
##D action indicators/dummies, separate their names with spaces.)
##D budgincrease veto
##D R> f1
##D budgincrease + veto ~ legparty + growth | 1 | legparty + growth | 
##D     0 | presparty + growth | presparty + growth
## End(Not run)



