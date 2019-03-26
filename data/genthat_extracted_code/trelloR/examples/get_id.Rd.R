library(trelloR)


### Name: get_id
### Title: Get model ID
### Aliases: get_id get_id_board get_id_card

### ** Examples

# Get Trello Development Roadmap board ID
url    = "https://trello.com/b/nC8QJJoZ/trello-development-roadmap"
tdr_id = get_id_board(url)

# Also works:
url    = "nC8QJJoZ"
tdr_id = get_id_board(url)



