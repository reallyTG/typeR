library(unitedR)


### Name: unitedSimOne
### Title: Simulating a formation
### Aliases: unitedSimOne

### ** Examples

home <- formation(10, NA, c(7,5,3), c(8,8), c(10,10,8))
away <- formation(5, 8, c(8,8), c(10,10), c(10,10,10), 
 hardness = c(0,0,0,0,1))
set.seed(123)
unitedSimOne(home, away)
# you can even simulated the game
unitedSimOne(home, away, r = 100)




