library(rematch2)


### Name: re_exec_all
### Title: Extract Data From All Regular Expression Matches Into a Data
###   Frame
### Aliases: re_exec_all

### ** Examples

name_rex <- paste0(
  "(?<first>[[:upper:]][[:lower:]]+) ",
  "(?<last>[[:upper:]][[:lower:]]+)"
)
notables <- c(
  "  Ben Franklin and Jefferson Davis",
  "\tMillard Fillmore"
)
# All occurrences
allpos <- re_exec_all(notables, name_rex)
allpos

# Custom $ to extract matches and positions
allpos$first$match
allpos$first$start
allpos$first$end



