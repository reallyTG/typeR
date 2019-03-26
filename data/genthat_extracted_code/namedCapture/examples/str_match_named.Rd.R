library(namedCapture)


### Name: str_match_named
### Title: str match named
### Aliases: str_match_named

### ** Examples


library(namedCapture)
chr.pos.vec <- c(
  "chr10:213,054,000-213,055,000",
  "chrM:111,000-222,000",
  "this will not match",
  NA, # neither will this.
  "chr1:110-111 chr2:220-222") # two possible matches.
chr.pos.pattern <- paste0(
  "(?<chrom>chr.*?)",
  ":",
  "(?<chromStart>.*?)",
  "-",
  "(?<chromEnd>[0-9,]*)")
## Specifying a list of conversion functions means that str_match_*
## should convert the matched groups from character to whatever is
## returned by those functions.
keep.digits <- function(x)as.integer(gsub("[^0-9]", "", x))
conversion.list <- list(chromStart=keep.digits, chromEnd=keep.digits)
(match.df <- str_match_named(chr.pos.vec, chr.pos.pattern, conversion.list))
str(match.df)




