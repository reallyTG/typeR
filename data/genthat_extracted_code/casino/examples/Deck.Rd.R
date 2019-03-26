library(casino)


### Name: Deck
### Title: Deck R6 Class
### Aliases: Deck
### Keywords: datasets

### ** Examples

# create a new deck
x <- Deck$new()
x

# draw a card
x$draw(1)
x

# draw 10 cards
x$draw(10)

# check how many cards are left
x$cards_left()

# reset the deck
x$shuffle()
x

# create a deck composed of 5 decks
x <- Deck$new(decks = 5)
x



