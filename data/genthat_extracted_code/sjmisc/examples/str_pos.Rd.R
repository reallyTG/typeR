library(sjmisc)


### Name: str_pos
### Title: Find partial matching and close distance elements in strings
### Aliases: str_pos

### ** Examples

## Not run: 
##D string <- c("Hello", "Helo", "Hole", "Apple", "Ape", "New", "Old", "System", "Systemic")
##D str_pos(string, "hel")   # partial match
##D str_pos(string, "stem")  # partial match
##D str_pos(string, "R")     # no match
##D str_pos(string, "saste") # similarity to "System"
##D 
##D # finds two indices, because partial matching now
##D # also applies to "Systemic"
##D str_pos(string,
##D         "sytsme",
##D         part.dist.match = 1)
##D 
##D # finds nothing
##D str_pos("We are Sex Pistols!", "postils")
##D # finds partial matching of similarity
##D str_pos("We are Sex Pistols!", "postils", part.dist.match = 1)
## End(Not run)




