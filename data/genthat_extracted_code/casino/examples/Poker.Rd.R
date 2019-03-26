library(casino)


### Name: Poker
### Title: Poker R6 Class
### Aliases: Poker
### Keywords: datasets

### ** Examples

set.seed(101315)
setup()

# draw poker
x <- Poker$new(who = "Player 1", type = "draw", bet = 10)
x$play()
x$hold(1, 2, 5)
x$draw()

# stud poker (bet 20)
x <- Poker$new(who = "Player 1", type = "stud", bet = 20)
x$play()

# clean-up
delete()



