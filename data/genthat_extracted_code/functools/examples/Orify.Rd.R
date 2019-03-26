library(functools)


### Name: Orify
### Title: Predicate function operator that creates new predicate functions
###   linked by the || operator.
### Aliases: Orify

### ** Examples

# Examples
is_character_or_factor <- Orify(is.character, is.factor)
is_character_or_factor(letters) # TRUE
is_character_or_factor(factor(state.abb)) # TRUE
is_character_or_factor(1:100) # FALSE



