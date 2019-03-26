library(testthat)
library(namedCapture)
context("variable args syntax")

for(engine in c("PCRE", "RE2")){
  namedCapture.engine(engine)
  test_engine <- function(msg, ...){
    test_that(paste(engine, msg), ...)
  }

  subject <- c(
    ten="chr10:213,054,000-213,055,000",
    chrNA="chrNA:111,000-222,000",
    no.match="foo bar",
    missing=NA,
    two="chr1:110-111 chr2:220-222")

  test_engine("str_match_variable returns character matrix", {
    computed <- str_match_variable(
      subject,
      chrom="chr.*?",
      ":",
      chromStart=".*?",
      "-",
      chromEnd="[0-9,]*")
    expected <- cbind(
      chrom=c("chr10", "chrNA", NA, NA, "chr1"),
      chromStart=c("213,054,000", "111,000", NA, NA, "110"),
      chromEnd=c("213,055,000", "222,000", NA, NA, "111"))
    rownames(expected) <- names(subject)
    expect_identical(computed, expected)
  })

  keep.digits <- function(x)as.integer(gsub("[^0-9]", "", x))
  test_engine("str_match_variable returns data.frame", {
    computed <- str_match_variable(
      subject,
      chrom="chr.*?",
      ":",
      chromStart=".*?", keep.digits,
      "-",
      chromEnd="[0-9,]*", keep.digits)
    expected <- data.frame(
      chrom=c("chr10", "chrNA", NA, NA, "chr1"),
      chromStart=as.integer(c(213054000, 111000, NA, NA, 110)),
      chromEnd=as.integer(c(213055000, 222000, NA, NA, 111)),
      stringsAsFactors=FALSE)
    rownames(expected) <- names(subject)
    expect_equivalent(computed, expected)
  })

  test_engine("named function is an error", {
    expect_error({
      str_match_variable(
        subject,
        chrom="chr.*?",
        ":",
        chromStart=".*?", fun=keep.digits,
        "-",
        chromEnd="[0-9,]*", keep.digits)
    }, "functions must not be named, problem: fun")
  })

  test_engine("str_match_all_variable returns character matrix", {
    computed <- str_match_all_variable(
      subject,
      chrom="chr.*?",
      ":",
      chromStart=".*?",
      "-",
      chromEnd="[0-9,]*")
    r <- function(chrom, chromStart, chromEnd){
      cbind(chrom=chrom, chromStart=chromStart, chromEnd=chromEnd)
    }
    expected <- rbind(
      r("chr10", "213,054,000", "213,055,000"),
      r("chrNA", "111,000", "222,000"),
      r("chr1", "110", "111"),
      r("chr2", "220", "222"))
    expect_identical(computed, expected)
  })

  test_engine("str_match_all_variable removes missing subjects", {
    computed <- str_match_all_variable(
      subject,
      "(?P<na>NA)")
    ## There should be only one NA (not two) because chrNA matches but
    ## the missing NA subject should be removed.
    expect_identical(computed, cbind(na="NA"))
  })

  test_engine("str_match_all_variable returns data.frame", {
    conversion.list <- list(chromStart=keep.digits, chromEnd=keep.digits)
    computed <- str_match_all_variable(
      subject,
      chrom="chr.*?",
      ":",
      chromStart=".*?", keep.digits,
      "-",
      chromEnd="[0-9,]*", keep.digits)
    expected <- rbind(
      data.frame(
        chrom="chr10", chromStart=213054000L, chromEnd=213055000L,
        stringsAsFactors=FALSE),
      data.frame(
        chrom="chrNA", chromStart=111000L, chromEnd=222000L,
        stringsAsFactors=FALSE),
      data.frame(
        chrom=c("chr1", "chr2"),
        chromStart=as.integer(c("110", "220")),
        chromEnd=as.integer(c("111", "222")),
        stringsAsFactors=FALSE))
    expect_identical(computed, expected)
  })

  test_engine("str_match_variable errors for one argument", {
    expect_error({
      str_match_variable("foo")
    }, "must have at least two arguments: subject, name=pattern, fun, ...")
  })

  test_engine("str_match_all_variable errors for one argument", {
    expect_error({
      str_match_all_variable("foo")
    }, "must have at least two arguments: subject, name=pattern, fun, ...")
  })

  test_engine("str_match_variable errors for multi-dim patterns", {
    expect_error({
      str_match_variable("foo", c("bar", "baz"))
    }, "patterns must be character vectors of length 1")
  })

  test_engine("str_match_all_variable errors for multi-dim patterns", {
    expect_error({
      str_match_all_variable("foo", c("bar", "baz"))
    }, "patterns must be character vectors of length 1")
  })

  test_engine("str_match_variable errors for 0-length patterns", {
    expect_error({
      str_match_variable("foo", character())
    }, "patterns must be character vectors of length 1")
  })

  test_engine("str_match_all_variable errors for 0-length patterns", {
    expect_error({
      str_match_all_variable("foo", character())
    }, "patterns must be character vectors of length 1")
  })

  test_engine("str_match_variable errors for non char/fun args", {
    expect_error({
      str_match_variable("foo", "bar", 1)
    }, "arguments must be", fixed=TRUE)
  })

  test_engine("str_match_all_variable errors for non char/fun args", {
    expect_error({
      str_match_all_variable("foo", "bar", 1)
    }, "arguments must be", fixed=TRUE)
  })

  test_engine("str_match_variable errors for two funs in a row", {
    expect_error({
      str_match_variable("foo", g="bar", as.integer, as.numeric)
    },
    "too many functions; up to one function may follow each named pattern")
  })

  test_engine("str_match_all_variable errors for two funs in a row", {
    expect_error({
      str_match_all_variable("foo", g="bar", as.integer, as.numeric)
    },
    "too many functions; up to one function may follow each named pattern")
  })

  test_engine("str_match_variable errors for fun at start", {
    expect_error({
      str_match_variable("foo", as.numeric)
    },
    "too many functions; up to one function may follow each named pattern")
  })

  test_engine("str_match_all_variable errors for fun at start", {
    expect_error({
      str_match_all_variable("foo", as.numeric)
    },
    "too many functions; up to one function may follow each named pattern")
  })

  test_engine("str_match_variable errors for NA pattern", {
    expect_error({
      str_match_variable("foo", g="bar", NA_character_, "baz")
    }, "patterns must not be missing/NA")
  })

  test_engine("str_match_all_variable errors for NA pattern", {
    expect_error({
      str_match_all_variable("foo", g="bar", NA_character_, "baz")
    }, "patterns must not be missing/NA")
  })

  range.pattern <- list(
    "[[]",
    task1="[0-9]+", as.integer,
    "(?:-",#begin optional end of range.
    taskN="[0-9]+", as.integer,
    ")?", #end is optional.
    "[]]")
  full.pattern <- list(
    job="[0-9]+", as.integer,
    "_",
    "(?:",#begin alternate
    task="[0-9]+", as.integer,
    "|",#either one task(above) or range(below)
    range.pattern,
    ")",#end alternate
    "(?:[.]",
    type=".*",
    ")?")
  subject.vec <- c(
    "13937810_25",
    "13937810_25.batch",
    "13937810_25.extern",
    "14022192_[1-3]",
    "14022204_[4]")
  all.args <- list(subject.vec, full.pattern)
  test_engine("nested lists are OK", {
    task.df <- do.call(str_match_variable, all.args)
    expect_identical(
      names(task.df),
      c("job", "task", "task1", "taskN", "type"))
    expect_identical(task.df$job, as.integer(c(
      13937810, 13937810, 13937810, 14022192, 14022204)))
    expect_identical(task.df$task, as.integer(c(
      25, 25, 25, NA, NA)))
    expect_identical(task.df$task1, as.integer(c(
      NA, NA, NA, 1, 4)))
    expect_identical(task.df$taskN, as.integer(c(
      NA, NA, NA, 3, NA)))
    expect_identical(task.df$type, c(
      "", "batch", "extern", "", ""))
  })


  trackDb.txt.gz <- system.file("extdata", "trackDb.txt.gz", package="namedCapture")
  trackDb.vec <- readLines(trackDb.txt.gz)

  test_engine("nested capture groups works", {
    name.pattern <- list(
      cellType=".*?",
      "_",
      sampleName=list(as.factor,
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
    expect_is(match.df, "data.frame")
    expect_identical(
      names(match.df),
      c("cellType", "sampleName", "sampleID", "dataType", "bigDataUrl"))
    expect_is(match.df$sampleName, "factor")
    expect_is(match.df$sampleID, "integer")
  })

  subject.vec <- c(
    "chr10:213,054,000-213,055,000",
    "chrM:111,000",
    "this will not match",
    NA, # neither will this.
    "chr1:110-111 chr2:220-222") # two possible matches.
  chr.pos.df <- str_match_variable(
    subject.vec,
    chrom="chr.*?",
    ":",
    chromStart="[0-9,]+", keep.digits,
    list(
      "-",
      chromEnd="[0-9,]+", keep.digits
    ), "?")
  test_engine("un-named list interpreted as non-capturing group", {
    expect_identical(
      chr.pos.df$chromStart,
      as.integer(c(213054000, 111000, NA, NA, 110)))
  })

  (foo.mat <- str_match_variable(
    c("foo", "foobar", "fooba"),
    first="foo",
    list("b", second="ar"), "?"))
  test_engine("un-named list interpreted as non-capturing group foo subject", {
    expect_identical(foo.mat[, "first"], c("foo", "foo", "foo"))
    expect_identical(foo.mat[, "second"], c("", "ar", ""))
  })

}
