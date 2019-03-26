library(whitechapelR)


### Name: end_round
### Title: Manage list of possible hideouts
### Aliases: end_round

### ** Examples

possibilities = start_round(64)
possibilities = take_a_step(possibilities,roads)
possibilities = take_a_step(possibilities,roads,blocked=list(c(63,82),c(63,65)))
possibilities = inspect_space(possibilities,space = c(29,30), clue = FALSE)
possibilities = inspect_space(possibilities,space = 49, clue = TRUE)
hideouts = end_round(possibilities,hideouts=NULL)
possibilities = start_round(67)
possibilities = take_a_step(possibilities,roads)
hideouts = end_round(possibilities,hideouts=hideouts)



