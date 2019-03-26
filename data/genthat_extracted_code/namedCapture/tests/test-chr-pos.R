library(namedCapture)
library(testthat)
context("chr pos")

for(engine in c("PCRE", "RE2")){
  namedCapture.engine(engine)
  test_engine <- function(msg, ...){
    test_that(paste(engine, msg), ...)
  }

  subject <- 
  c(ten="chr10:213,054,000-213,055,000",
    M="chrM:111,000-222,000",
    no.match="foo bar",
    missing=NA,
    two="chr1:110-111 chr2:220-222")

pattern.not.greedy <- paste0(
  "(?P<chrom>chr.*?)",
  ":",
  "(?P<chromStart>.*?)",
  "-",
  "(?P<chromEnd>[0-9,]*)")

test_engine("str_match_named returns character matrix", {
  computed <- str_match_named(subject, pattern.not.greedy)
  expected <- cbind(
    chrom=c("chr10", "chrM", NA, NA, "chr1"),
    chromStart=c("213,054,000", "111,000", NA, NA, "110"),
    chromEnd=c("213,055,000", "222,000", NA, NA, "111"))
  rownames(expected) <- names(subject)
  expect_identical(computed, expected)
})

test_engine("str_match_named returns data.frame", {
  keep.digits <- function(x)as.integer(gsub("[^0-9]", "", x))
  conversion.list <- list(chromStart=keep.digits, chromEnd=keep.digits)
  computed <- str_match_named(subject, pattern.not.greedy, conversion.list)
  expected <- data.frame(
    chrom=c("chr10", "chrM", NA, NA, "chr1"),
    chromStart=as.integer(c(213054000, 111000, NA, NA, 110)),
    chromEnd=as.integer(c(213055000, 222000, NA, NA, 111)),
    stringsAsFactors=FALSE)
  rownames(expected) <- names(subject)
  expect_equivalent(computed, expected)
})

test_engine("str_match_named converts with as.integer", {
  no.commas <- gsub(",", "", subject)
  conversion.list <- list(chromStart=as.integer, chromEnd=as.numeric)
  computed <- str_match_named(no.commas, pattern.not.greedy, conversion.list)
  expected <- data.frame(
    chrom=c("chr10", "chrM", NA, NA, "chr1"),
    chromStart=as.integer(c(213054000, 111000, NA, NA, 110)),
    chromEnd=as.numeric(c(213055000, 222000, NA, NA, 111)),
    stringsAsFactors=FALSE)
  rownames(expected) <- names(subject)
  expect_identical(computed, expected)
})

test_engine("str_match_all_named returns list of character matrices", {
  computed <- str_match_all_named(subject, pattern.not.greedy)
  expected <- list(
    cbind(chrom="chr10", chromStart="213,054,000", chromEnd="213,055,000"),
    cbind(chrom="chrM", chromStart="111,000", chromEnd="222,000"),
    matrix(character(), nrow=0),
    matrix(character(), nrow=0),
    cbind(chrom=c("chr1", "chr2"),
          chromStart=c("110", "220"),
          chromEnd=c("111", "222")))
  names(expected) <- names(subject)
  expect_identical(computed, expected)
})

  test_engine("str_match_all_named returns list of data.frames", {
    keep.digits <- function(x)as.integer(gsub("[^0-9]", "", x))
    conversion.list <- list(chromStart=keep.digits, chromEnd=keep.digits)
    computed <- str_match_all_named(subject, pattern.not.greedy, conversion.list)
    expected <- list(
      data.frame(chrom="chr10", chromStart=213054000L, chromEnd=213055000L,
                 stringsAsFactors=FALSE),
      data.frame(chrom="chrM", chromStart=111000L, chromEnd=222000L,
                 stringsAsFactors=FALSE),
      data.frame(),
      data.frame(),
      data.frame(chrom=c("chr1", "chr2"),
                 chromStart=as.integer(c("110", "220")),
                 chromEnd=as.integer(c("111", "222")),
                 stringsAsFactors=FALSE))
    names(expected) <- names(subject)
    expect_identical(computed, expected)
  })

}
