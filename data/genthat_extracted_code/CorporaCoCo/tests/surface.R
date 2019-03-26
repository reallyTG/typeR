library(CorporaCoCo)
library(data.table)
library(unittest, quietly=TRUE)

test_for_error <- function(code, expected_regexp = '.+') {
    tryCatch({
            code
            return("No error returned")
        }, error = function(e) {
            if(grepl(expected_regexp, e$message)) return(TRUE)
            return(c(e$message, "Expected error did not match - ", expected_regexp))
        }
    )
}


# -----
# tests
# -----

ok_group("parse_span", {
    expected <- list(left = 5, right = 0)
    got <- local({parse_span('5L')}, asNamespace('CorporaCoCo'))
    ok( identical(got, expected), "5L")
    expected <- list(left = 0, right = 5)
    got <- local({parse_span('5R')}, asNamespace('CorporaCoCo'))
    ok( identical(got, expected), "5R")
    expected <- list(left = 5, right = 5)
    got <- local({parse_span('5LR')}, asNamespace('CorporaCoCo'))
    ok( identical(got, expected), "5LR")
    expected <- list(left = 5, right = 5)
    got <- local({parse_span('5RL')}, asNamespace('CorporaCoCo'))
    ok( identical(got, expected), "5RL")
    expected <- list(left = 5, right = 5)
    got <- local({parse_span('5R5L')}, asNamespace('CorporaCoCo'))
    ok( identical(got, expected), "5R5L")
    expected <- list(left = 1, right = 5)
    got <- local({parse_span('1L5R')}, asNamespace('CorporaCoCo'))
    ok( identical(got, expected), "1L5R")
    expected <- list(left = 2, right = 3)
    got <- local({parse_span('3R2L')}, asNamespace('CorporaCoCo'))
    ok( identical(got, expected), "3R2L")
    expected <- list(left = 2, right = 0)
    got <- local({parse_span('2L0R')}, asNamespace('CorporaCoCo'))
    ok( identical(got, expected), "2L0R")
    expected <- list(left = 0, right = 2)
    got <- local({parse_span('0L2R')}, asNamespace('CorporaCoCo'))
    ok( identical(got, expected), "0L2R")

    # errors
    ok(test_for_error(local({parse_span('cat')}, asNamespace('CorporaCoCo')), "span"),  "cat  (error)")
    ok(test_for_error(local({parse_span('5B')}, asNamespace('CorporaCoCo')), "span"),   "5B   (error)")
    ok(test_for_error(local({parse_span('5RR')}, asNamespace('CorporaCoCo')), "span"),  "5RR  (error)")
    ok(test_for_error(local({parse_span('5LL')}, asNamespace('CorporaCoCo')), "span"),  "5LL  (error)")
    ok(test_for_error(local({parse_span('5L2L')}, asNamespace('CorporaCoCo')), "span"), "5L2L (error)")
    ok(test_for_error(local({parse_span('LR')}, asNamespace('CorporaCoCo')), "span"),   "LR   (error)")
    ok(test_for_error(local({parse_span('0LR')}, asNamespace('CorporaCoCo')), "span"),  "0LR  (error)")
    ok(test_for_error(local({parse_span('0L0R')}, asNamespace('CorporaCoCo')), "span"), "0L0R (error)")
})


ok_group("main", {

    x <- c("a", "man", "a", "plan", "a", "canal", "panama")
    expected <- data.table(
        x =            c("a", "a",     "a",   "a",      "a",    "canal",  "man", "man",  "plan", "plan"),
        y =            c("a", "canal", "man", "panama", "plan", "panama", "a",   "plan", "a",    "canal"),
        H = as.integer(c( 2,   1,       1,     1,        1,      1,        1,     1,      1,      1)),
        M = as.integer(c( 4,   5,       5,     5,        5,      0,        1,     1,      1,      1))
    )
    setkey(expected, x, y)
    rv <- surface(x, span = '2R')
    ok( identical(rv, expected), "defaults")

    # include NA
    new_rows <- data.table(
        x =            c("canal", "panama"),
        y =            c( NA,      NA),
        H = as.integer(c( 1,       2)),
        M = as.integer(c( NA,      NA))
    )
    expected <- rbindlist(list(expected, new_rows), use.names = TRUE)
    setkey(expected, x, y)
    assign('unittest_surface_include_na', TRUE, pos = CorporaCoCo:::pkg_vars)
    rv <- surface(x, span = '2R')
    ok( identical(rv, expected), "include NA")
    ok( sum(rv$H) == 2 * length(x), "include NA - sum of counts is span times length(x)")
    assign('unittest_surface_include_na', FALSE, pos = CorporaCoCo:::pkg_vars)

    # some NAs in x
    x <- c("a", "man", "a", "plan", NA, NA, "a", "canal", "panama")
    expected <- data.table(
        x =            c("a", "a",     "a",   "a",      "a",    "canal",  "man", "man"),
        y =            c("a", "canal", "man", "panama", "plan", "panama", "a",   "plan"),
        H = as.integer(c( 1,   1,       1,     1,        1,      1,        1,     1)),
        M = as.integer(c( 4,   4,       4,     4,        4,      0,        1,     1))
    )
    setkey(expected, x, y)
    rv <- surface(x, span = '2R')
    ok( identical(rv, expected), "NAs in x")

    # some NAs in x and include NA
    new_rows <- data.table(
        x =            c("a", "plan", "canal", "panama", NA,  NA,  NA),
        y =            c( NA,  NA,     NA,      NA,      NA, "a", "canal"),
        H = as.integer(c( 1,   2,      1,       2,       1,   2,   1)),
        M = as.integer(c( NA,  NA,     NA,      NA,      NA,  NA,  NA))
    )
    expected <- rbindlist(list(expected, new_rows), use.names = TRUE)
    setkey(expected, x, y)
    assign('unittest_surface_include_na', TRUE, pos = CorporaCoCo:::pkg_vars)
    rv <- surface(x, span = '2R')
    ok( identical(rv, expected), "NAs in x and include NA")
    ok( sum(rv$H) == 2 * length(x), "NAs in x and include NA - sum of counts is span times length(x)")
    assign('unittest_surface_include_na', FALSE, pos = CorporaCoCo:::pkg_vars)

    # span left
    x <- c("a", "man", "a", "plan", "a", "canal", "panama")
    expected <- data.table(
        x =            c("a", "canal", "man", "panama", "plan", "panama", "a",   "plan", "a",    "canal"),
        y =            c("a", "a",     "a",   "a",      "a",    "canal",  "man", "man",  "plan", "plan"),
        H = as.integer(c( 2,   1,       1,     1,        1,      1,        1,     1,      1,      1)),
        M = as.integer(c( 2,   1,       0,     1,        1,      1,        3,     1,      3,      1))
    )
    setkey(expected, x, y)
    rv <- surface(x, span = '2L')
    ok( identical(rv, expected), "span left")

    # span left, include NA
    new_rows <- data.table(
        x =            c("a", "man"),
        y =            c( NA, NA),
        H = as.integer(c( 2,  1)),
        M = as.integer(c( NA, NA))
    )
    expected <- rbindlist(list(expected, new_rows), use.names = TRUE)
    setkey(expected, x, y)
    assign('unittest_surface_include_na', TRUE, pos = CorporaCoCo:::pkg_vars)
    rv <- surface(x, span = '2L')
    ok( identical(rv, expected), "span left, include NA")
    ok( sum(rv$H) == 2 * length(x), "span left, include NA - sum of counts is span times length(x)")
    assign('unittest_surface_include_na', FALSE, pos = CorporaCoCo:::pkg_vars)

    # span both
    x <- c("a", "man", "a", "plan", "a", "canal", "panama")
    expected <- data.table(
        x =            c("a", "a",     "a",   "a",      "a",    "canal",  "man", "man",  "plan", "plan",  "canal", "panama", "panama", "plan", "canal"),
        y =            c("a", "canal", "man", "panama", "plan", "panama", "a",   "plan", "a",    "canal", "a",     "a",      "canal",  "man",  "plan"),
        H = as.integer(c( 4,   1,       2,     1,        2,      1,        2,     1,      2,      1,       1,       1,        1,        1,      1)),
        M = as.integer(c( 6,   9,       8,     9,        8,      2,        1,     2,      2,      3,       2,       1,        1,        3,      2))
    )
    setkey(expected, x, y)
    rv <- surface(x, span = '2LR')
    ok( identical(rv, expected), "span both")

    # span both, some NAs, include NA
    x <- c("a", "man", NA, NA, "a", "plan", NA, NA, "a", "canal", "panama")
    expected <- data.table(
        x =            c("a",  "a", "a",    "a",     "a",      "man",  "man",  NA,    NA, NA,  NA,     NA,     "plan", "plan", "canal", "canal",  "canal", "panama", "panama", "panama"),
        y =            c("man", NA, "plan", "canal", "panama", "a",     NA,   "man", "a", NA, "plan", "canal", "a",     NA,    "a",     "panama",  NA,     "a",      "canal",   NA),
        H = as.integer(c( 1,    8,   1,      1,       1,        1,      3,     2,     6,  4,   3,      1,       1,      3,      1,       1,        2,       1,        1,        2)),
        M = as.integer(c( 3,    NA,  3,      3,       3,        0,      NA,    NA,    NA, NA,  NA,     NA,      0,      NA,     1,       1,        NA,      1,        1,        NA))
    )
    setkey(expected, x, y)
    assign('unittest_surface_include_na', TRUE, pos = CorporaCoCo:::pkg_vars)
    rv <- surface(x, span = '2LR')
    ok( identical(rv, expected), "span both, NAs in x and include NA" )
    ok( sum(rv$H) == 2 * 2 * length(x), "span both, include NA - sum of counts is 2 * span times length(x)")
    assign('unittest_surface_include_na', FALSE, pos = CorporaCoCo:::pkg_vars)
})

ok_group("filters", {
    x <- c("a", "man", "a", "plan", "a", "canal", "panama")
    expected <- data.table(
        x =            c("a", "a",     "a",   "a",      "a"),
        y =            c("a", "canal", "man", "panama", "plan"),
        H = as.integer(c( 2,   1,       1,     1,        1)),
        M = as.integer(c( 4,   5,       5,     5,        5))
    )
    setkey(expected, x, y)
    rv <- surface(x, span = '2R', nodes = "a")
    ok( identical(rv, expected), "filter on a single node")

    x <- c("a", "man", "a", "plan", "a", "canal", "panama")
    expected <- data.table(
        x =            c("canal",  "man", "man",  "plan", "plan"),
        y =            c("panama", "a",   "plan", "a",    "canal"),
        H = as.integer(c( 1,        1,     1,      1,      1)),
        M = as.integer(c( 0,        1,     1,      1,      1))
    )
    setkey(expected, x, y)
    nodes_filter <- c("canal", "man", "plan")
    rv <- surface(x, span = '2R', nodes = nodes_filter)
    ok( identical(rv, expected), "filter on nodes with vector")

    x <- c("a", "man", "a", "plan", "a", "canal", "panama")
    expected <- data.table(
        x =            c("a",      "a",    "canal",  "man"),
        y =            c("panama", "plan", "panama", "plan"),
        H = as.integer(c(1,        1,      1,         1)),
        M = as.integer(c(5,        5,      0,         1))
    )
    setkey(expected, x, y)
    rv <- surface(x, span = '2R', collocates = c("plan", "panama"))
    ok( identical(rv, expected), "filter on collocates")

    x <- c("a", "man", "a", "plan", "a", "canal", "panama")
    expected <- data.table(
        x =            c("canal",  "man",  "plan"),
        y =            c("panama", "a", "a"),
        H = as.integer(c( 1,        1,      1)),
        M = as.integer(c( 0,        1,      1))
    )
    setkey(expected, x, y)
    rv <- surface(x, span = '2R', nodes = c("canal", "man", "plan"), collocates = c("panama", "a"))
    ok( identical(rv, expected), "filter on nodes and collocates")

    # span both
    x <- c("a", "man", "a", "plan", "a", "canal", "panama")
    expected <- data.table(
        x =            c("a", "a",      "man", "plan"),
        y =            c("a", "panama", "a",   "a"),
        H = as.integer(c( 4,   1,        2,     2)),
        M = as.integer(c( 6,   9,        1,     2))
    )
    setkey(expected, x, y)
    rv <- surface(x, span = '2LR', nodes = c("a", "man", "plan"), collocates = c("panama", "a"))
    ok( identical(rv, expected), "span both")

    x <- c("a", "man", "a", "plan", "a", "canal", "panama")
    expected <- data.table(
        x =            c("a", "a",   "a",    "man"),
        y =            c("a", "man", "plan", "a"),
        H = as.integer(c( 2,   2,     1,      1)),
        M = as.integer(c( 3,   3,     4,      0))
    )
    setkey(expected, x, y)
    rv <- surface(x, span = '3L', nodes = c("a", "man"))
    ok( identical(rv, expected), "span left, overlapping left edge")

    x <- c("a", "man", "a", "plan", "a", "canal", "panama")
    expected <- data.table(
        x =            c("a", "a",     "a",   "a",      "a",    "canal"),
        y =            c("a", "canal", "man", "panama", "plan", "panama"),
        H = as.integer(c( 2,   2,       1,     1,        2,      1)),
        M = as.integer(c( 6,   6,       7,     7,        6,      0))
    )
    setkey(expected, x, y)
    rv <- surface(x, span = '3R', nodes = c("a", "canal"))
    ok( identical(rv, expected), "span right, overlapping right edge")

    # some NAs in x
    x <- c("a", "man", "a", "plan", NA, NA, "a", "canal", "panama")
    expected <- data.table(
        x =            c("canal",  "man"),
        y =            c("panama", "a"),
        H = as.integer(c( 1,        1)),
        M = as.integer(c( 0,        1))
    )
    setkey(expected, x, y)
    rv <- surface(x, span = '2R', nodes = c("canal", "man", "plan"), collocates = c("panama", "a"))
    ok( identical(rv, expected), "filter nodes and collocates with NAs in x")

    # include NA not tested. Edge effects make determining a sensible behaviour tricky
    # and this functionality is not exposed.
})

ok_group("bad arguments", {

    ok(test_for_error(surface(span = '2L')), "x not given")
    ok(test_for_error(surface(x = "hello", span = '2R'), "'x'"), "x not a vector")
    ok(test_for_error(surface(x = 1:5, span = '2R'), "'x'"), "x not a character vector")
    ok(test_for_error(surface(x = as.factor(c('hello', 'big', 'world')), span = '2R'), "'x'"), "x is a vector of factors")

    ok(test_for_error(surface(x = c('hello', 'world'))), "span not given")
    ok(test_for_error(surface(x = c('hello', 'world'), span = '0R'), 'span'), "span is zero")
    ok(test_for_error(surface(x = c('hello', 'world'), span = c('1R', '2R')), 'span'), "bad span; vector of values")
})
