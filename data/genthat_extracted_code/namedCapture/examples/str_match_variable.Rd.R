library(namedCapture)


### Name: str_match_variable
### Title: str match variable
### Aliases: str_match_variable

### ** Examples


library(namedCapture)
chr.pos.vec <- c(
  "chr10:213,054,000-213,055,000",
  "chrM:111,000-222,000",
  "this will not match",
  NA, # neither will this.
  "chr1:110-111 chr2:220-222") # two possible matches.
keep.digits <- function(x)as.integer(gsub("[^0-9]", "", x))
## str_match_variable finds the first match in each element of
## the subject character vector. Named arguments are used to create
## named capture groups, and conversion functions such as
## keep.digits are used to convert the previously named group.
(match.df <- str_match_variable(
  chr.pos.vec, 
  chrom="chr.*?",
  ":",
  chromStart=".*?", keep.digits,
  "-",
  chromEnd="[0-9,]*", keep.digits))
str(match.df)




