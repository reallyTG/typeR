library(nzelect)


### Name: allocate_seats
### Title: Allocate seats after election
### Aliases: allocate_seats

### ** Examples


# From Wikipedia; should return 3, 2, 2:
allocate_seats(c(53000, 24000, 23000), nseats = 7, threshold = 0)

# From 2014 New Zealand election
votes <- c(National = 1131501, Labour = 604535, Green = 257359,
           NZFirst = 208300, Cons = 95598, IntMana = 34094, 
           Maori = 31849, Act = 16689, United = 5286,
           Other = 20411)
electorate = c(41, 27, 0, 
               0, 0, 0, 
               1, 1, 1,
               0)
               
# Actual result:               
allocate_seats(votes, electorate = electorate)

# Result if there were no 5% minimum threshold:
allocate_seats(votes, electorate = electorate, threshold = 0)$seats_v



