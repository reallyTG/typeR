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
chr.pos.pattern <- paste0(
  "(?<chrom>chr.*?)",
  ":",
  "(?<chromStart>[0-9,]+)",
  "(?:",
    "-",
    "(?<chromEnd>[0-9,]*)",
  ")?")
namedCapture::str_match_named(subject.vec, chr.pos.pattern)

## ------------------------------------------------------------------------
namedCapture::str_match_variable(
  subject.vec, 
  "(?<chrom>chr.*?)",
  ":",
  "(?<chromStart>[0-9,]+)",
  "(?:",
    "-",
    "(?<chromEnd>[0-9,]+)",
  ")?")

## ------------------------------------------------------------------------
namedCapture::str_match_variable(
  subject.vec, 
  chrom="chr.*?",
  ":",
  chromStart="[0-9,]+",
  "(?:",
    "-",
    chromEnd="[0-9,]+",
  ")?")

## ------------------------------------------------------------------------
keep.digits <- function(x)as.integer(gsub("[^0-9]", "", x))
namedCapture::str_match_variable(
  subject.vec, 
  chrom="chr.*?",
  ":",
  chromStart="[0-9,]+", keep.digits,
  "(?:",
    "-",
    chromEnd="[0-9,]+", keep.digits,
  ")?")

## ------------------------------------------------------------------------
pos.pattern <- list("[0-9,]+", keep.digits)
namedCapture::str_match_variable(
  subject.vec, 
  chrom="chr.*?",
  ":",
  chromStart=pos.pattern,
  "(?:",
    "-",
    chromEnd=pos.pattern,
  ")?")

## ------------------------------------------------------------------------
pos.pattern <- list("[0-9,]+", keep.digits)
namedCapture::str_match_variable(
  subject.vec, 
  chrom="chr.*?",
  ":",
  chromStart=pos.pattern,
  list(
    "-",
    chromEnd=pos.pattern
  ), "?")

## ------------------------------------------------------------------------
trackDb.txt.gz <- system.file(
  "extdata", "trackDb.txt.gz", package="namedCapture")
trackDb.vec <- readLines(trackDb.txt.gz)

## ------------------------------------------------------------------------
cat(trackDb.vec[78:107], sep="\n")

## ------------------------------------------------------------------------
fields.df <- namedCapture::str_match_all_variable(
  trackDb.vec,
  "track ",
  name="\\S+",
  fields="(?:\n[^\n]+)*",
  "\n")

## ------------------------------------------------------------------------
head(fields.df)

## ------------------------------------------------------------------------
fields.list <- namedCapture::str_match_all_named(
  fields.df[, "fields"], paste0(
    "\\s+",
    "(?<name>.*?)",
    " ",
    "(?<value>[^\n]+)"))

## ------------------------------------------------------------------------
fields.list[12:14]

## ------------------------------------------------------------------------
fields.list$bcell_McGill0091Coverage["bigDataUrl",]
fields.list$monocyte_McGill0001Peaks["color",]
has.bigDataUrl <- sapply(fields.list, function(m)"bigDataUrl" %in% rownames(m))
bigDataUrl.list <- fields.list[has.bigDataUrl]
length(bigDataUrl.list)
length(fields.list)

## ------------------------------------------------------------------------
name.pattern <- list(
  cellType=".*?",
  "_",
  sampleName=list(
    "McGill",
    sampleID="[0-9]+", as.integer),
  dataType="Coverage|Peaks",
  "|",
  "[^\n]+")
match.df <- namedCapture::str_match_all_variable(
  trackDb.vec,
  "track ",
  name=name.pattern,
  "(?:\n[^\n]+)*",
  "\\s+bigDataUrl ",
  bigDataUrl="[^\n]+")
head(match.df)

## ------------------------------------------------------------------------
(sacct.df <- data.frame(
  Elapsed = c(
    "07:04:42", "07:04:42", "07:04:49",
    "00:00:00", "00:00:00"),
  JobID=c(
    "13937810_25",
    "13937810_25.batch",
    "13937810_25.extern",
    "14022192_[1-3]",
    "14022204_[4]"),
  stringsAsFactors=FALSE))

## ------------------------------------------------------------------------
## Define some sub-patterns separately for clarity.
range.pattern <- list(
  "[[]",
  task1="[0-9]+", as.integer,
  "(?:-",#begin optional end of range.
  taskN="[0-9]+", as.integer,
  ")?", #end is optional.
  "[]]")
task.pattern <- list(
  "(?:",#begin alternate
  task="[0-9]+", as.integer,
  "|",#either one task(above) or range(below)
  range.pattern,
  ")")#end alternate
(task.df <- namedCapture::df_match_variable(
  sacct.df,
  JobID=list(
    job="[0-9]+", as.integer,
    "_",
    task.pattern,
    "(?:[.]",
    type=".*",
    ")?"),
  Elapsed=list(
    hours="[0-9]+", as.integer,
    ":",
    minutes="[0-9]+", as.integer,
    ":",
    seconds="[0-9]+", as.integer)))

## ------------------------------------------------------------------------
library(data.table)
sacct.dt <- data.table(sacct.df)
(task.dt <- namedCapture::df_match_variable(
  sacct.dt,
  JobID=list(
    job="[0-9]+", as.integer,
    "_",
    task.pattern,
    "(?:[.]",
    type=".*",
    ")?"),
  Elapsed=list(
    hours="[0-9]+", as.integer,
    ":",
    minutes="[0-9]+", as.integer,
    ":",
    seconds="[0-9]+", as.integer)))

