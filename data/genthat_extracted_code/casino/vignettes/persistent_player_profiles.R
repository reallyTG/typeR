## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(casino)

# create a new file to store player profiles
setup()

# create some players
Player$new("Player 1")

# check the available players
players()

## ------------------------------------------------------------------------
# create more players
Player$new("Player 2")
Player$new("Player 3")

# check the available players
players()

## ------------------------------------------------------------------------
# first profile
setup(".bellagio")
Player$new("Player 1")
Player$new("Player 2")
players()

# second profile
setup(".caesars")
Player$new("Player 3")
Player$new("Player 4")
players()

# now switch back to the first one
setup(".bellagio")
players()

## ------------------------------------------------------------------------
# delete current profile (.bellagio)
delete()

# delete a different profile (.caesars)
setup(".caesars")
delete()

# delete the default profile (.casino)
setup()
delete()

