library(strex)


### Name: str_after_nth
### Title: Text before or after nth occurrence of pattern.
### Aliases: str_after_nth str_after_first str_after_last str_before_nth
###   str_before_first str_before_last

### ** Examples

string <- "ab..cd..de..fg..h"
str_after_nth(string, "\\.\\.", 3)
str_before_nth(string, "e", 1)
str_before_nth(string, "\\.", -3)
str_before_nth(string, ".", -3)
str_before_nth(rep(string, 2), fixed("."), -3)



