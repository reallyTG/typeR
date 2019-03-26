library(namedCapture)


### Name: str_match_all_named
### Title: str match all named
### Aliases: str_match_all_named

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
## Use str_match_all_named to get ALL matches in each subject (not
## just the first match).
(match.df.list <- str_match_all_named(
  chr.pos.vec, chr.pos.pattern, conversion.list))
str(match.df.list)
## If there is a capture group named "name" then it will be used for
## the rownames of the result.
name.value.vec <- c(
  H3K27me3="  sampleType=monocyte   assayType=H3K27me3    cost=5",
  H3K27ac="sampleType=monocyte assayType=H3K27ac",
  H3K4me3=" sampleType=Myeloidcell cost=30.5  assayType=H3K4me3")
name.value.pattern <- paste0(
  "(?<name>[^ ]+?)",
  "=",
  "(?<value>[^ ]+)")
str_match_all_named(name.value.vec, name.value.pattern)




