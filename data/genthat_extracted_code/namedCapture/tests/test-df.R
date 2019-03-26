library(testthat)
library(namedCapture)
context("df")

for(engine in c("PCRE", "RE2")){
  namedCapture.engine(engine)
  test_engine <- function(msg, ...){
    test_that(paste(engine, msg), ...)
  }

  subject.df <- data.frame(
    JobID=c(
      "13937810_25",
      "13937810_25.batch",
      "13937810_25.extern",
      "14022192_[1-3]",
      "14022204_[4]"),
    subject=c(
      ten="chr10:213,054,000-213,055,000",
      chrNA="chrNA:111,000-222,000",
      no.match="foo bar",
      missing=NA,
      two="chr1:110-111 chr2:220-222"),
    stringsAsFactors=FALSE)
  range.pattern <- list(
    "[[]",
    task1="[0-9]+", as.integer,
    "(?:-",#begin optional end of range.
    taskN="[0-9]+", as.integer,
    ")?", #end is optional.
    "[]]")
  test_engine("df_match_variable returns data.frame with rownames", {
    match.df <- df_match_variable(
      subject.df,
      JobID=list(
        job="[0-9]+", as.integer,
        "_",
        "(?:",#begin alternate
        task="[0-9]+", as.integer,
        "|",#either one task(above) or range(below)
        range.pattern,
        ")",#end alternate
        "(?:[.]",
        type=".*",
        ")?"),
      subject=list(
        chrom="chr.*?",
        ":",
        chromStart=".*?", 
        "-",
        chromEnd="[0-9,]*"))
    expect_identical(names(match.df), c(
      "JobID", "subject",
      "JobID.job", "JobID.task", "JobID.task1", "JobID.taskN", "JobID.type",
      "subject.chrom", "subject.chromStart", "subject.chromEnd"))
    expect_identical(match.df$JobID.job, as.integer(c(
      13937810, 13937810, 13937810, 14022192, 14022204)))
    expect_identical(match.df$JobID.task, as.integer(c(
      25, 25, 25, NA, NA)))
    expect_identical(match.df$JobID.task1, as.integer(c(
      NA, NA, NA, 1, 4)))
    expect_identical(match.df$JobID.taskN, as.integer(c(
      NA, NA, NA, 3, NA)))
    expect_identical(match.df$JobID.type, c(
      "", "batch", "extern", "", ""))
    expect_identical(match.df$subject.chrom, c(
      "chr10", "chrNA", NA, NA, "chr1"))
    expect_identical(match.df$subject.chromStart, c(
      "213,054,000", "111,000", NA, NA, "110"))
    expect_identical(match.df$subject.chromEnd, c(
      "213,055,000", "222,000", NA, NA, "111"))
    expect_identical(rownames(match.df), c(
      "ten", "chrNA", "no.match", "missing", "two"))
  })

  no.rownames <- data.frame(
    JobID=c(
      "13937810_25",
      "13937810_25.batch",
      "13937810_25.extern",
      "14022192_[1-3]",
      "14022204_[4]"),
    position=c(
      "chr10:213,054,000-213,055,000",
      "chrNA:111,000-222,000",
      "foo bar",
      NA,
      "chr1:110-111 chr2:220-222"),
    stringsAsFactors=FALSE)
  test_engine("df_match_variable returns data.frame with default rownames", {
    match.df <- df_match_variable(
      no.rownames,
      JobID=list(
        job="[0-9]+", as.integer,
        "_",
        "(?:",#begin alternate
        task="[0-9]+", as.integer,
        "|",#either one task(above) or range(below)
        range.pattern,
        ")",#end alternate
        "(?:[.]",
        type=".*",
        ")?"),
      position=list(
        chrom="chr.*?",
        ":",
        chromStart=".*?", 
        "-",
        chromEnd="[0-9,]*"))
    expect_identical(names(match.df), c(
      "JobID", "position",
      "JobID.job", "JobID.task", "JobID.task1", "JobID.taskN", "JobID.type",
      "position.chrom", "position.chromStart", "position.chromEnd"))
    expect_identical(match.df$JobID.job, as.integer(c(
      13937810, 13937810, 13937810, 14022192, 14022204)))
    expect_identical(match.df$JobID.task, as.integer(c(
      25, 25, 25, NA, NA)))
    expect_identical(match.df$JobID.task1, as.integer(c(
      NA, NA, NA, 1, 4)))
    expect_identical(match.df$JobID.taskN, as.integer(c(
      NA, NA, NA, 3, NA)))
    expect_identical(match.df$JobID.type, c(
      "", "batch", "extern", "", ""))
    expect_identical(match.df$position.chrom, c(
      "chr10", "chrNA", NA, NA, "chr1"))
    expect_identical(match.df$position.chromStart, c(
      "213,054,000", "111,000", NA, NA, "110"))
    expect_identical(match.df$position.chromEnd, c(
      "213,055,000", "222,000", NA, NA, "111"))
    expect_identical(rownames(match.df), paste(1:5))
  })

  uniq.chr <- data.frame(
    JobID=c(
      "13937810_25",
      "13937810_25.batch",
      "13937810_25.extern",
      "14022192_[1-3]",
      "14022204_[4]"),
    position=c(
      "chr10:213,054,000-213,055,000",
      "chrNA:111,000-222,000",
      "chr2:1-2",
      "chr3:4-5",
      "chr1:110-111 chr2:220-222"),
    stringsAsFactors=FALSE)
  keep.digits <- function(x)as.integer(gsub("[^0-9]", "", x))
  test_engine("df_match_variable takes rownames from first pattern", {
    match.df <- df_match_variable(
      uniq.chr,
      JobID=list(
        name="[^.]+[.].|[0-9]+",
        rest=".*"),
      position=list(
        chrom="chr.*?",
        ":",
        chromStart=".*?", keep.digits,
        "-",
        chromEnd="[0-9,]*", keep.digits))
    expect_identical(names(match.df), c(
      "JobID", "position", "JobID.rest", 
      "position.chrom", "position.chromStart", "position.chromEnd"))
    expect_identical(match.df$JobID.rest, c(
      "_25", "atch", "xtern", "_[1-3]", "_[4]"))
    expect_identical(match.df$position.chrom, c(
      "chr10", "chrNA", "chr2", "chr3", "chr1"))
    expect_identical(match.df$position.chromStart, as.integer(c(
      213054000, 111000, 1, 4, 110)))
    expect_identical(match.df$position.chromEnd, as.integer(c(
      213055000, 222000, 2, 5, 111)))
    expect_identical(rownames(match.df), c(
      "13937810", "13937810_25.b", "13937810_25.e", "14022192", "14022204"))
  })

  test_engine("df_match_variable takes rownames from second pattern", {
    match.df <- df_match_variable(
      uniq.chr,
      JobID=list(
        pre="[^.]+[.].|[0-9]+",
        rest=".*"),
      position=list(
        name="chr.*?",
        ":",
        chrom_start=".*?", keep.digits,
        "-",
        chrom_end="[0-9,]*", keep.digits))
    expect_identical(names(match.df), c(
      "JobID", "position", "JobID.pre", "JobID.rest", 
      "position.chrom_start", "position.chrom_end"))
    expect_identical(match.df$JobID.pre, c(
      "13937810", "13937810_25.b", "13937810_25.e", "14022192", "14022204"))
    expect_identical(match.df$JobID.rest, c(
      "_25", "atch", "xtern", "_[1-3]", "_[4]"))
    expect_identical(match.df$position.chrom_start, as.integer(c(
      213054000, 111000, 1, 4, 110)))
    expect_identical(match.df$position.chrom_end, as.integer(c(
      213055000, 222000, 2, 5, 111)))
    expect_identical(rownames(match.df), c(
      "chr10", "chrNA", "chr2", "chr3", "chr1"))
  })

  named.uniq.chr <- data.frame(
    JobID=c(
      foo="13937810_25",
      bar="13937810_25.batch",
      baz="13937810_25.extern",
      sars="14022192_[1-3]",
      last="14022204_[4]"),
    position=c(
      "chr10:213,054,000-213,055,000",
      "chrNA:111,000-222,000",
      "chr2:1-2",
      "chr3:4-5",
      "chr1:110-111 chr2:220-222"),
    stringsAsFactors=FALSE)
  test_engine("df_match_variable does not take rownames from first pattern", {
    match.df <- df_match_variable(
      named.uniq.chr,
      JobID=list(
        name="[^.]+[.].|[0-9]+",
        rest=".*"),
      position=list(
        chrom="chr.*?",
        ":",
        chromStart=".*?", keep.digits,
        "-",
        chromEnd="[0-9,]*", keep.digits))
    expect_identical(names(match.df), c(
      "JobID", "position", "JobID.name", "JobID.rest", 
      "position.chrom", "position.chromStart", "position.chromEnd"))
    expect_identical(match.df$JobID.name, c(
      "13937810", "13937810_25.b", "13937810_25.e", "14022192", "14022204"))
    expect_identical(match.df$JobID.rest, c(
      "_25", "atch", "xtern", "_[1-3]", "_[4]"))
    expect_identical(match.df$position.chrom, c(
      "chr10", "chrNA", "chr2", "chr3", "chr1"))
    expect_identical(match.df$position.chromStart, as.integer(c(
      213054000, 111000, 1, 4, 110)))
    expect_identical(match.df$position.chromEnd, as.integer(c(
      213055000, 222000, 2, 5, 111)))
    expect_identical(rownames(match.df), c("foo", "bar", "baz", "sars", "last"))
  })

  test_engine("df_match_variable does not take rownames from second pattern", {
    match.df <- df_match_variable(
      named.uniq.chr,
      JobID=list(
        first="[^.]+[.].|[0-9]+",
        rest=".*"),
      position=list(
        name="chr.*?",
        ":",
        chromStart=".*?", keep.digits,
        "-",
        chromEnd="[0-9,]*", keep.digits))
    expect_identical(names(match.df), c(
      "JobID", "position", "JobID.first", "JobID.rest", 
      "position.name", "position.chromStart", "position.chromEnd"))
    expect_identical(match.df$JobID.first, c(
      "13937810", "13937810_25.b", "13937810_25.e", "14022192", "14022204"))
    expect_identical(match.df$JobID.rest, c(
      "_25", "atch", "xtern", "_[1-3]", "_[4]"))
    expect_identical(match.df$position.name, c(
      "chr10", "chrNA", "chr2", "chr3", "chr1"))
    expect_identical(match.df$position.chromStart, as.integer(c(
      213054000, 111000, 1, 4, 110)))
    expect_identical(match.df$position.chromEnd, as.integer(c(
      213055000, 222000, 2, 5, 111)))
    expect_identical(rownames(match.df), c("foo", "bar", "baz", "sars", "last"))
  })

  test_engine("error for two name groups with un-named subject", {
    expect_error({
      df_match_variable(
        uniq.chr,
        JobID=list(
          name="[^.]+[.].|[0-9]+",
          rest=".*"),
        position=list(
          name="chr.*?",
          ":",
          chromStart=".*?", keep.digits,
          "-",
          chromEnd="[0-9,]*", keep.digits))
    }, "only one group named 'name' is allowed")
  })

  test_engine("take names from named subject even with two named groups", {
    match.df <- df_match_variable(
      named.uniq.chr,
      JobID=list(
        name="[^.]+[.].|[0-9]+",
        rest=".*"),
      position=list(
        name="chr.*?",
        ":",
        chromStart=".*?", keep.digits,
        "-",
        chromEnd="[0-9,]*", keep.digits))
    expect_identical(names(match.df), c(
      "JobID", "position", "JobID.name", "JobID.rest", 
      "position.name", "position.chromStart", "position.chromEnd"))
    expect_identical(match.df$JobID.name, c(
      "13937810", "13937810_25.b", "13937810_25.e", "14022192", "14022204"))
    expect_identical(match.df$JobID.rest, c(
      "_25", "atch", "xtern", "_[1-3]", "_[4]"))
    expect_identical(match.df$position.name, c(
      "chr10", "chrNA", "chr2", "chr3", "chr1"))
    expect_identical(match.df$position.chromStart, as.integer(c(
      213054000, 111000, 1, 4, 110)))
    expect_identical(match.df$position.chromEnd, as.integer(c(
      213055000, 222000, 2, 5, 111)))
    expect_identical(rownames(match.df), c("foo", "bar", "baz", "sars", "last"))
  })

  test_engine("error for no pattern", {
    expect_error({
      df_match_variable(uniq.chr)
    }, "no patterns specified in ...")
  })

  test_engine("error for un-named list", {
    expect_error({
      df_match_variable(uniq.chr, list())
    }, "each pattern in ... must be named using a column name of subject")
  })

  test_engine("error for un-named list with name", {
    expect_error({
      df_match_variable(uniq.chr, list(foo="bar"))
    }, "each pattern in ... must be named using a column name of subject")
  })

  test_engine("error for un-recognized name", {
    expect_error({
      df_match_variable(uniq.chr, foo="bar")
    }, "each pattern in ... must be named using a column name of subject")
  })

  test_engine("error for non-df subject", {
    expect_error({
      df_match_variable(c("foo", "bar"), list(foo="bar"))
    }, "subject must be a data.frame with character columns to match")
  })

  test_engine("error for non-df subject", {
    expect_error({
      df_match_variable(c("foo", "bar"), foo="bar")
    }, "subject must be a data.frame with character columns to match")
  })

  test_engine("error for factor column", {
    expect_error({
      df_match_variable(data.frame(foo="bar"), foo="bar")
    }, "subject.vec should be a character vector with length>0")
  })

} 
