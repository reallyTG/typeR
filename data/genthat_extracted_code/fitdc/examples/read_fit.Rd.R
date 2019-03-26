library(fitdc)


### Name: read_fit
### Title: Decode a FIT file
### Aliases: read_fit

### ** Examples

## An example of generating a table of record messages
## from the file provided with this package:

fp <- system.file("extdata/example.fit", package = "fitdc")
data_mesgs <- read_fit(fp)

## Filter out the record messages:

is_record <- function(mesg) mesg$name == "record"
records <- Filter(is_record, data_mesgs)

format_record <- function(record) {
  out <- record$fields
  names(out) <- paste(names(out), record$units, sep = ".")
  out
}

records <- lapply(records, format_record)

## Some records have missing fields:

colnames_full <- names(records[[which.max(lengths(records))]])
empty <- setNames(
  as.list(rep(NA, length(colnames_full))),
  colnames_full)

merge_lists <- function(ls_part, ls_full) {
  extra <- setdiff(names(ls_full), names(ls_part))
  append(ls_part, ls_full[extra])[names(ls_full)]  # order as well
}

records <- lapply(records, merge_lists, empty)
records <- data.frame(
  do.call(rbind, records))

head(records)  # voila



