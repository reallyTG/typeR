## Overview

overview <- function(...) {
  bind_rows(...)
}

overview_table <- function(...) {
  overview(...) %>%
    my_datatable(page_size=Inf)
}

my_datatable <- function(df, page_size=20, round=TRUE, ...) {
  options <- if (nrow(df) < page_size) {
    list(paging=FALSE, searching=FALSE, info=FALSE)
  } else {
    list(paging=TRUE, searching=TRUE, info=TRUE, pageLength=page_size)
  }
  
  table <- datatable(df, options=options, ...)
  if (round) {
    table <- formatRound(table, sapply(df, is.numeric), 2)
  }
  table
}

r <- function(name, value, ...) {
  stopifnot(is.character(name))
  stopifnot(length(name) == 1)
  
  UseMethod("r", value)  
}

r.numeric <- function(name, value, ...) {
  raw_str <- fmt(value, ...)
  rnd_str <- fmt(oom(value), ...)
  
  if (!is.na(value) && raw_str != rnd_str) {
    tag(str_c(name, " rnd"), rnd_str)
  }
  
  NextMethod("r", value)
}

r.Duration <- function(name, value, ...) {
  units <- c("years", "days", "hours", "minutes", "seconds")
  
  for (u in units) {
    v <- as.numeric(value, units=u)
    class(v) <- "num_with_suffix"
    attr(v, "suffix") <- paste0(" ", u)
    
    if (all(v > 1)) break
  }

  r(name, v)
}

r.default <- function(name, value, ...) {
  stopifnot(length(value) == 1)
  
  value <- fmt(value, ...)
  tag_name <- tag(name, value)
  
  tibble(name=str_c(name, " (\\", tag_name, ")"), value=value)
}

r.data.frame <- function(name, value, ...) {
  r(name, nrow(value))
}

ratio <- function(x, y) {
  percent(to_ratio_num(x)/to_ratio_num(y))
}

to_ratio_num <- function(x) {
  UseMethod("to_ratio_num")
}

to_ratio_num.numeric <- identity

to_ratio_num.data.frame <- function(x) nrow(x)

## Tags

#' Create a new tags container
#'
#' It creates a new tags container that will be associated with the given
#' `filename` and the tags will be prefixed with `prefix` string.
#'
#' @param filename the name of the file where the tags will be stored.
#' @param prefix the string to prepend to all tag names.
#' @param default if `TRUE` make this the default tags container.
#'
#' @export
create_tags <- function(filename, prefix="", default=TRUE) {
  tags <- new.env(parent=emptyenv())
  tags$filename <- filename
  tags$prefix <- prefix
  clear_tags(tags)
  
  if (default) {
    set_default_tags(tags)
  }
  
  writeLines("", filename)
  
  class(tags) <- "latextags"
  
  invisible(tags)
}

clear_tags <- function(tags=get_default_tags()) {
  tags$values <- tibble::tibble(name=character(), value=character(), latex=character())
}

tags_filename <- function(tags) {
  tags$filename
}

tags_prefix <- function(tags) {
  tags$prefix
}

tags <- function(tags) {
  tags$values
}

tags_latex <- function(tags) {
  tags(tags)$latex
}

#' Create a new tag
#'
#' Creates a new tag named `name` with value `value` in the `tags` tags
#' container.
#'
#' @param name the tag name.
#' @param value the tag value.
#' @param tags the tag container, using the default container by default.
#'
#' @export
tag <- function(name, value, tags=get_default_tags()) {
  if (is.null(tags)) {
    return(value)
  }
  
  stopifnot(is.character(name))
  stopifnot(length(name)==1)
  
  value <- as.character(value)
  latex_tag_name <- generate_latex_command_name(name, prefix=tags_prefix(tags))
  latex <- generate_latex_command(latex_tag_name, value)
  
  existing <- which(tags$values$name == name)
  
  if (length(existing) > 0) {
    tags$values[existing, "value"] <- value
    tags$values[existing, "latex"] <- latex
  } else {
    tags$values <- tibble::add_row(
      tags$values,
      name,
      value,
      latex
    )
  }
  
  save_tag_file(tags)
  
  invisible(latex_tag_name)
}

rm_tag <- function(name, tags=get_default_tags()) {
  if (is.null(tags)) {
    return(value)
  }
  
  stopifnot(is.character(name))

  removed <- dplyr::semi_join(tags$values, tibble(name), by="name")$name
  
  tags$values <- dplyr::anti_join(tags$values, tibble(name), by="name")
  
  save_tag_file(tags)
  
  invisible(removed)
}

fmt_tag <- function(name, value, ...) {
  tag(name, fmt(value), ...)
}

latex_command_name <- function(s) {
  stringr::str_replace_all(s, "\\(.*\\)", "") %>%
  stringr::str_to_title() %>%
  stringr::str_replace_all("\\s", "")
}

# TODO: test on latex_escape
latex_escape <- function(s) {
  s %>%
    stringr::str_replace_all("\\%", "\\\\%") %>%
    stringr::str_replace_all("_", "\\_") %>%
    stringr::str_replace_all("-", "")
}

generate_latex_command_name <- function(name, prefix="") {
  if (nchar(prefix)) {
    prefix <- stringr::str_c(prefix, " ")
  }
  
  name <- stringr::str_c(prefix, name)
  name <- latex_command_name(name)
  
  latex_escape(name)
}

generate_latex_command <- function(command_name, value) {
  stopifnot(length(command_name) == length(value))
  
  stringr::str_c(
    "\\newcommand{\\", command_name, "}{", latex_escape(value), "\\xspace}"
  )
}

save_tag_file <- function(tags) {
  out <- stringr::str_c(tags(tags)$latex, collapse="\n")
  writeLines(out, tags_filename(tags))
}

get_default_tags <- function() {
  getOption("latextags_default")
}

set_default_tags <- function(tags) {
  options(latextags_default=tags)
}

#' @export
as.list.latextags <- function(x, ...) {
  list(
    filename=tags_filename(x),
    prefix=tags_prefix(x),
    tags=tags(x)
  )
}

#' @export
format.latextags <- function(x, ...) {
  format(as.list(x), ...)
}

#' @export
print.latextags <- function(x, ...) {
  print(as.list(x), ...)
}

## Formatting

#' Formats given value.
#'
#' The `x` value is formatted according to its class with an additional
#' `prefix` and `suffix` prepended and appended respectively.
#'
#' @param x the value to be formatted
#' @param prefix the string to be prepended
#' @param suffix the string to be appended
#' @param ... parameters to be passed to the actual formatter. The number
#'     formatter accepts `floor` and `ceiling` to indicate that given value
#'     should be rounded down or up to a full integer before formatting or
#'     `digits` to indicate the number of digits the number should be rounded
#'     to.
#'
#' @export
fmt <- function(x, prefix="", suffix="", ...) {
  if (is.null(x)) {
    NULL
  } else {
    v <- as.character(.fmt(x, ...))
    
    stringr::str_c(prefix, v, suffix)
  }
}

.fmt <- function(x, ...) {
  UseMethod(".fmt", x)
}

.fmt.default <- function(x) {
  x
}

.fmt.integer <- function(x) {
  format(x, big.mark=",", trim=TRUE)
}

# TODO: make this parameters part of some global options so they can be set globally
# TODO: test c(0.0123, 1.123, -0.0123, -1.123)
.fmt.double <- function(x, digits=1, floor=FALSE, ceiling=FALSE) {
  if (floor) x <- floor(x)
  if (ceiling) x <- ceiling(x)
  
  x <- sapply(x, function(y) {
    y <- abs(y)
    
    if (is.na(y)) y
    else if (y < 1) signif(y, digits)
    else if (y > 1) round(y, digits)
    else y
  })

  prettyNum(x, big.mark=",", scientific=F)
}

.fmt.num_with_suffix <- function(x, floor=FALSE, ceiling=FALSE, digits=1) {
  suffix <- attr(x, "suffix")
  fmt(as.double(x), suffix=suffix, floor=floor, ceiling=ceiling, digits=digits)
}

#' Converts given value to a percent representation.
#'
#' It multiples the value by 100 and adds the `%` suffix attribute.
#'
#' @param x the value to convert
#'
#' @export
percent <- function(x) {
  x <- x*100
  class(x) <- "num_with_suffix"
  attr(x, "suffix") <- "%"
  x
}

# TODO: test for x < 0 and x > base^length(suffixes)
scale_with_suffix <- function(x, base, suffixes) {
  stopifnot(all(base > 0))
  stopifnot(length(suffixes) > 0)
  stopifnot(is.character(suffixes))
 
  scale <- if (length(base) == 1) {
    base^(1:length(suffixes))
  } else {
    stopifnot(length(base) == length(x))
    base
  }
  scale <- scale[1:length(suffixes)-1]
  
  magnitute <- floor(log(abs(x), base))
  magnitute[magnitute < 0] <- 0
  magnitute[magnitute > length(scale)] <- length(scale)
  
  magnitute <- as.integer(magnitute)
  suffix <- sapply(magnitute, function(x) suffixes[x + 1])
  
  d <- base^magnitute
  v <- x / d
  class(v) <- "num_with_suffix"
  attr(v, "suffix") <- suffix
  v
}

#' Scale the value to its closest order of magnitude
#'
#' It uses the base of 1000.
#'
#' @param x the value to scale
#' @param suffixes are the suffixes to be add. Each corresponds to the exponent
#'     of the base.
#'
#' @export
oom <- function(x, ...) {
  UseMethod("oom")
}

oom.numeric <- function(x, suffixes=c("", "K", "M", "G", "T")) {
  scale_with_suffix(x, base=1000, suffixes=suffixes)
}

oom.data.frame <- function(x, ...) oom(nrow(x), ...)

#' Scale the value to its closest order of magnitude in the size of bytes.
#'
#' It uses the base of 1024.
#'
#' @param x the value to scale
#' @param units are the suffixes to be add. Each corresponds to the exponent
#'     of the base.
#'
#' @export
size <- function(x, units=c("B", "kB", "MB", "GB", "TB")) {
  scale_with_suffix(x, base=1024, suffixes=units)
}