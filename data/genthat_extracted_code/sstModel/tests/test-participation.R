# unit tests for S3 class participation
context("participation S3 class")

# checking constructor
test_that("participation: checks at construction are ok", {

  # error when some parameters are missing
  expect_error(participation(currency = "CHF"))
  expect_error(participation(value = 100))

  # type checks
  expect_error(participation(currency = list("CHF"), value = 1),
               "types")
  expect_error(participation(currency = "CHF", value = list()),
               "types")
  expect_error(participation(currency = 1, value = 10),
               "types")
  expect_error(participation(currency="CHF", value="ten"),
               "types")

  # dimensions checks
  expect_error(participation(currency=c("CHF","EUR"), value=10),
               "dimensions")
  expect_error(participation(currency=c("CHF"), value=c(10,10)),
               "dimensions")

  # input values checks
  expect_error(participation(currency=as.character(NA), value=10),
               "Missing")
  expect_error(participation(currency=c("CHF"), value=NaN),
               "Missing")

  # value checks
  expect_error(participation(currency="CHF", value = Inf),
               "value")
  expect_warning(participation(currency="CHF", value = 0),
               "efficiency")
  expect_error(participation(currency="CHF", value = -100),
               "value")

})

test_that("participation: internal structure is ok", {

  # define a participation
  a <- participation(currency="CHF", value=10)

  # checking internal representation of attributes
  expect_equal(length(a), 2)
  expect_equal(names(a), c("currency", "value"))

  # checking class membership
  expect_equal(is.participation(a), TRUE)
  expect_equal(is.item(a), TRUE)
  expect_equal(is.list(a), TRUE)

})

test_that("participation: check method is OK", {

  # check.participation
  cov.mat <- diag(2, 2, 2) %*% diag(rep(1, 2)) %*% diag(2, 2, 2)
  name <- c("EURCHF", "AAACHF")
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  mapping.table <- mappingTable(currency(name     = "EURCHF",
                                         from     = "EUR",
                                         to       = "CHF"),
                                spread(name     = "AAACHF",
                                       currency = "CHF",
                                       rating   = "AAA"))
  initial.values <- list()

  initial.values$initial.fx <- data.frame(from             = "EUR",
                                          to               = "CHF",
                                          fx               = 1.05,
                                          stringsAsFactors = F)

  initial.values$initial.rate <- data.frame(time             = 1L,
                                            currency         = "CHF",
                                            rate             = 0.01,
                                            stringsAsFactors = F)

  mapping.time <- data.frame(time = 1L, mapping = "k", stringsAsFactors = F)

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency   = "CHF",
                   mapping.time   = mapping.time)

  expect_true(check.participation(participation(currency = "CHF",
                                                value    = 10),
                                  mr))

  expect_true(!check.participation(participation(currency = "JPY",
                                                 value    = 10),
                                  mr))

  mapping.table <- mappingTable(rate(name     = "EURCHF",
                                     currency = "CHF",
                                     horizon  = "k"),
                                spread(name     = "AAACHF",
                                       currency = "CHF",
                                       rating   = "AAA"))

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_true(check.participation(participation(currency = "CHF",
                                                value    = 10),
                                  mr))

})

test_that("participation: standard methods are ok", {


  # format
  expect_equal(class(format(participation(currency = "CHF",
                                          value    = 10))),
               "character")

  # summary
  expect_equal(class(summary(participation(currency = "CHF",
                                           value    = 10))),
               c("summaryDefault", "table"))

  # print
  expect_equal(class(print(participation(currency = "CHF",
                                         value    = 10))),
               "NULL")

})
