library(whitechapelR)


### Name: inspect_space
### Title: Update paths based on inspections
### Aliases: inspect_space

### ** Examples

possibilities = start_round(64)
possibilities = take_a_step(possibilities,roads)
possibilities = take_a_step(possibilities,roads,blocked=list(c(63,82),c(63,65)))
possibilities = inspect_space(possibilities,space = c(29,30), clue = FALSE)
possibilities = inspect_space(possibilities,space = 49, clue = TRUE)



