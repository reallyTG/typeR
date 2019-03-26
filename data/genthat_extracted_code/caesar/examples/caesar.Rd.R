library(caesar)


### Name: caesar
### Title: Encrypt and Decrypt text using the Caesar cipher
### Aliases: caesar

### ** Examples

# Please see this for more info.
# https://en.wikipedia.org/wiki/Caesar_cipher

caesar("cats are friends!")
caesar("fdwv@duh@iulhqgv&", reverse = TRUE)

caesar("cats are friends!", direction = "right", distance = 40)
caesar("ki10:izm:nzqmvl0;", direction = "right", distance = 40, reverse = TRUE)

caesar("cats are #1 friend!", direction = "left", distance = -12)
caesar(", hgy f&ypy%f:&b@z", direction = "left", distance = -12, reverse = TRUE)



