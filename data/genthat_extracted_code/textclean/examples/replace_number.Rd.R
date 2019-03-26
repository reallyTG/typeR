library(textclean)


### Name: replace_number
### Title: Replace Numbers With Text Representation
### Aliases: replace_number
### Keywords: number-to-word

### ** Examples

x <- c(
    NA, 
    'then .456 good', 
    'none', 
    "I like 346,457 ice cream cones.", 
    "I like 123456789 cashes.",     
    "They are 99 percent good and 45678.2345667"
)
replace_number(x)
replace_number(x, num.paste = TRUE)
replace_number(x, remove=TRUE)
## Not run: 
##D library(textclean)
##D hunthou <- replace_number(seq_len(1e5)) 
##D 
##D textclean::mgsub(
##D     "'twenty thousand three hundred five' into 20305", 
##D     hunthou, 
##D     seq_len(1e5)
##D )
##D ## "'20305' into 20305"
##D 
##D ## Larger example from: https://stackoverflow.com/q/18332463/1000343
##D ## A slower approach
##D fivehunthou <- replace_number(seq_len(5e5)) 
##D 
##D testvect <- c("fifty seven", "four hundred fifty seven", 
##D     "six thousand four hundred fifty seven", 
##D     "forty six thousand four hundred fifty seven", 
##D     "forty six thousand four hundred fifty seven", 
##D     "three hundred forty six thousand four hundred fifty seven"
##D )
##D 
##D textclean::mgsub(testvect, fivehunthou, seq_len(5e5))
## End(Not run)



