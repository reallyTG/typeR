library(rematch2)


### Name: re_match_all
### Title: Extract All Regular Expression Matches Into a Data Frame
### Aliases: re_match_all

### ** Examples

name_rex <- paste0(
  "(?<first>[[:upper:]][[:lower:]]+) ",
  "(?<last>[[:upper:]][[:lower:]]+)"
)
notables <- c(
  "  Ben Franklin and Jefferson Davis",
  "\tMillard Fillmore"
)
re_match_all(notables, name_rex)



