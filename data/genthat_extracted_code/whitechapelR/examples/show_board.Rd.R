library(whitechapelR)


### Name: show_board
### Title: Display game board representation
### Aliases: show_board

### ** Examples

possibilities = start_round(64)
possibilities = take_a_step(possibilities,roads)
possibilities = take_a_step(possibilities,roads,blocked=list(c(63,82),c(63,65)))
possibilities = take_a_step(possibilities,alley)
show_board(paths=possibilities,hideouts=NULL,roads,alley,node_locations)



