library(datafsm)


### Name: find_wildcards
### Title: Find Indices for Non-identifiable Elements of State Matrix.
### Aliases: find_wildcards

### ** Examples

tft_state <- matrix(c(1, 1, 1, 1, 2, 2, 2, 2), 2, 4)
tft_action <- matrix(c(1, 2))
find_wildcards(tft_state, tft_action,  c(1, 2, 1, 2))




