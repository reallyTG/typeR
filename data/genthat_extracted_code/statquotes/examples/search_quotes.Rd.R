library(statquotes)


### Name: search_quotes
### Title: Function to search quote database
### Aliases: search_quotes

### ** Examples

search_quotes("^D") # regex to find all quotes that start with "D"
search_quotes("Tukey") #all quotes with "Tukey"
search_quotes("bad answer", fuzzy = TRUE) # fuzzy match

# to a data.frame
out <- search_quotes("bad answer", fuzzy = TRUE)
as.data.frame(out)




