library(rabi)


### Name: how_many
### Title: Assistance with choosing ID scheme parameters
### Aliases: how_many

### ** Examples

 #Let's generate some tables to see the number of unique IDs we could get given:
total.length <- 4  #we have ~4 positions to mark,
redundancy <- 1    #we're interested in being robust to a single erasure,
alphabet <- 5      #and we currently have 5 types of color bands in stock

how_many(total.length, redundancy, alphabet)




