library(casino)


### Name: Slots
### Title: Slots R6 Class
### Aliases: Slots
### Keywords: datasets

### ** Examples

set.seed(101315)
setup()

# start the slot machine
x <- Slots$new(who = "Player 1", bet = 10)

# play 1 game
x$play()

# play >1 game at a time
x$play(spins = 3)

# clean-up
delete()



