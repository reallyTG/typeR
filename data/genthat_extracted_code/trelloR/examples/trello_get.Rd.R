library(trelloR)


### Name: trello_get
### Title: Get Data From Trello API
### Aliases: trello_get

### ** Examples

# No authorization is required to access public boards. Let's get
# the ID of Trello Development Roadmap board:
url = "https://trello.com/b/nC8QJJoZ/trello-development-roadmap"
bid = get_id_board(url)

# Once we have the ID, we can use it to make specific queries:
labels = get_board_labels(bid)           # Get all labels
cards = get_board_cards(bid, limit = 5)  # Get 5 cards

# We can also call trello_get() directly:
lists = trello_get(parent = "board", child = "lists", id = bid)

# As with boards, cards can be queried for particular resources:
card1id = cards$id[1]
card1act = get_card_actions(card1id) # Get all comments

# To retrieve large results, paging might be necessary:

## Not run: 
##D 
##D tdr_actions = get_board_actions(bid, paging = TRUE)
## End(Not run)

# For private boards, you need a secure token:

## Not run: 
##D 
##D token = get_token("your_key", "your_secret")
##D all_open_cards = get_board_cards(board_id, token, filter = "open")
## End(Not run)



