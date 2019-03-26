library(rematch2)


### Name: re_exec
### Title: Extract Data From First Regular Expression Match Into a Data
###   Frame
### Aliases: re_exec $.rematch_records $.rematch_allrecords

### ** Examples

name_rex <- paste0(
  "(?<first>[[:upper:]][[:lower:]]+) ",
  "(?<last>[[:upper:]][[:lower:]]+)"
)
notables <- c(
  "  Ben Franklin and Jefferson Davis",
  "\tMillard Fillmore"
)
# Match first occurrence
pos <- re_exec(notables, name_rex)
pos

# Custom $ to extract matches and positions
pos$first$match
pos$first$start
pos$first$end



