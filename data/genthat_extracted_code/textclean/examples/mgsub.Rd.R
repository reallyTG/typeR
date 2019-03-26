library(textclean)


### Name: mgsub
### Title: Multiple 'gsub'
### Aliases: mgsub mgsub_fixed mgsub_regex mgsub_regex_safe

### ** Examples

mgsub(DATA$state, c("it's", "I'm"), c("it is", "I am"))
mgsub(DATA$state, "[[:punct:]]", "PUNC", fixed = FALSE)
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
##D 
##D ## Safe substitution: Uses the mgsub package as the backend
##D dubious_string <- "Dopazamine is a fake chemical"
##D pattern <- c("dopazamin","do.*ne")
##D replacement <- c("freakout","metazamine")
##D 
##D mgsub(dubious_string, pattern, replacement, ignore.case = TRUE, fixed = FALSE)
##D mgsub(dubious_string, pattern, replacement, safe = TRUE, fixed = FALSE)
## End(Not run)



