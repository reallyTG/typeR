## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
subject.vec <- c(
  "chr10:213,054,000-213,055,000",
  "chrM:111,000",
  "this will not match",
  NA, # neither will this.
  "chr1:110-111 chr2:220-222") # two possible matches.

## ------------------------------------------------------------------------
chr.pos.pattern <- paste0(
  "(?<chrom>chr.*?)",
  ":",
  "(?<chromStart>[0-9,]+)",
  "(?:",
    "-",
    "(?<chromEnd>[0-9,]+)",
  ")?")

## ------------------------------------------------------------------------
(match.mat <- namedCapture::str_match_named(subject.vec, chr.pos.pattern))
str(match.mat)

## ------------------------------------------------------------------------
keep.digits <- function(x)as.integer(gsub("[^0-9]", "", x))
conversion.list <- list(chromStart=keep.digits, chromEnd=keep.digits)
(match.df <- namedCapture::str_match_named(
  subject.vec, chr.pos.pattern, conversion.list))
str(match.df)

## ------------------------------------------------------------------------
namedCapture::str_match_all_named(
  subject.vec, chr.pos.pattern, conversion.list)

## ------------------------------------------------------------------------
name.pattern <- paste0(
  "(?<name>chr.*?)",
  ":",
  "(?<chromStart>[0-9,]+)",
  "(?:",
    "-",
    "(?<chromEnd>[0-9,]+)",
  ")?")
try(named.mat <- namedCapture::str_match_named(
  subject.vec, name.pattern, conversion.list))
(named.mat <- namedCapture::str_match_named(
  subject.vec[-(3:4)], name.pattern, conversion.list))
(named.list <- namedCapture::str_match_all_named(
  subject.vec, name.pattern, conversion.list))

## ------------------------------------------------------------------------
named.mat["chr1", "chromStart"]
named.list[[5]]["chr2", "chromStart"]

## ------------------------------------------------------------------------
named.subject.vec <- c(
  ten="chr10:213,054,000-213,055,000",
  M="chrM:111,000",
  nomatch="this will not match",
  missing=NA, # neither will this.
  two="chr1:110-111 chr2:220-222") # two possible matches.
namedCapture::str_match_named(
  named.subject.vec, chr.pos.pattern, conversion.list)
namedCapture::str_match_all_named(
  named.subject.vec, chr.pos.pattern, conversion.list)

## ------------------------------------------------------------------------
named.subject.vec <- c(
  ten="chr10:213,054,000-213,055,000",
  M="chrM:111,000",
  nomatch="this will not match",
  missing=NA, # neither will this.
  two="chr1:110-111 chr2:220-222") # two possible matches.
namedCapture::str_match_named(
  named.subject.vec, name.pattern, conversion.list)
namedCapture::str_match_all_named(
  named.subject.vec, name.pattern, conversion.list)

