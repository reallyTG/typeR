library(CollapsABEL)


### Name: shiftedStem
### Title: Add a "shift" suffix to a stem
### Aliases: shiftedStem

### ** Examples

## Not run: 
##D # add suffix to stem
##D shiftedStem("a", 100) == "a_shift_0100"
##D shiftedStem("home/a", 100) == "home/a_shift_0100"
##D shiftedStem("/home/a", 100) == "/home/a_shift_0100"
##D shiftedStem(c("/home/a", "/home/b"), 100) == c("/home/a_shift_0100",
##D 		"/home/b_shift_0100")
## End(Not run)




