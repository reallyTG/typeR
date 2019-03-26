library(comperank)


### Name: stoch-modifiers
### Title: Stochastic matrix modifiers
### Aliases: stoch-modifiers teleport vote_equal vote_self

### ** Examples

input_stoch <- matrix(c(0, 0.3,
                        0, 0.7),
                      ncol = 2, byrow = TRUE)
teleport(0.15)(input_stoch)

vote_equal(input_stoch)

vote_self(input_stoch)




