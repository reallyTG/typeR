library(casino)


### Name: Blackjack
### Title: Blackjack R6 Class
### Aliases: Blackjack
### Keywords: datasets

### ** Examples

set.seed(101315)
setup()

# sit at the blackjack table
x <- Blackjack$new(who = "Player 1", bet = 10)

# play a hand
x$play()

x$hit()

x$stand()

# play a hand blind w/out drawing
x$play()$stand()

# clean-up
delete()



