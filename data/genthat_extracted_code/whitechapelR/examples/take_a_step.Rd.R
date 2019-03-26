library(whitechapelR)


### Name: take_a_step
### Title: Track one movement
### Aliases: take_a_step

### ** Examples

possibilities = start_round(64)
possibilities = take_a_step(possibilities,roads)
possibilities = take_a_step(possibilities,roads,blocked=list(c(63,82),c(63,65)))
possibilities = take_a_step(possibilities,alley)



