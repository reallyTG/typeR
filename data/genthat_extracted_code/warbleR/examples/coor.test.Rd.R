library(warbleR)


### Name: coor.test
### Title: Randomization test for singing coordination
### Aliases: coor.test

### ** Examples

{
#load  simulated singing data (see data documentation)
data(sim_coor_sing)

# testing if coordination happens less than expected by chance
coor.test(sim_coor_sing, iterations = 100, less.than.chance = TRUE)

# testing if coordination happens more than expected by chance
coor.test(sim_coor_sing, iterations = 100, less.than.chance = FALSE)
}




