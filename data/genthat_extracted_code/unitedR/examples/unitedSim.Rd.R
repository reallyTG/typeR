library(unitedR)


### Name: unitedSim
### Title: Simulating a formation
### Aliases: unitedSim

### ** Examples

home <- formation(10, NA, c(7,5,3), c(8,8), c(10,10,8))
away <- formation(5, 8, c(8,8), c(10,10), c(10,10,10), 
 hardness = c(0,0,0,0,1))
set.seed(123)
unitedSim(home, away)
# can also be simualated
unitedSim(home, away, r = 100)
# several away lineups
unitedSim(home, away, away)
# several away lineups simulated
unitedSim(home, away, away, r = 100)
# used hardness matrix (default)
# shows the probability of receiving a specifed number of yellow cards
# dependent on the used points of hardness
dimNams <-  list(paste(0:7, "cards"), paste(0:10, "hardness points"))
(hardnessMatrix <- matrix(c(90,10,0,0,0,0,0,0,
70,30,0,0,0,0,0,0,50,40,10,
0,0,0,0,0,30,50,20,0,0,0,0,0,20,40,30,10,0,0,
0,0,10,30,40,20,0,0,0,0,0,20,40,30,10,0,0,0,0,
10,30,40,20,0,0,0,0,0,20,40,30,10,0,0,0,0,10,20,
40,20,10,0,0,0,0,10,40,20,20,10), nrow = 8,
dimnames = dimNams))





