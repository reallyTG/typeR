library(etm)


### Name: tra
### Title: Matrix of possible transitions
### Aliases: tra tra_ill tra_ill_comp tra_comp tra_surv
### Keywords: survival miscellaneous

### ** Examples

tra_ill()

## competing risks model with 4 competing events non-default state names
tra_comp(4, state.names = c("healthy", "Cardiac problems", "Cancer",
                           "Rhenal failure", "Other"))



