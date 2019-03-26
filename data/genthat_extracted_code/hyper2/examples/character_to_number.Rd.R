library(hyper2)


### Name: character_to_number
### Title: Convert a character vector to a numeric vector
### Aliases: character_to_number char2num

### ** Examples


H <- hyper2(pnames=letters[1:9])

# Use numbers:
H + order_likelihood(sample(9))  


# Use letters:
H + order_likelihood(character_to_number(sample(letters[1:9]),pnames(H)))






