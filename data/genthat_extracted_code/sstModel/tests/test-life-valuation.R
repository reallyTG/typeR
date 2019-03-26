# unit tests for S3 class life
context("life: valuation")

test_that("valInfo of life is ok", {

  ## a first example
  cov.mat <- diag(2, 2) %*% diag(rep(1, 2)) %*% diag(2, 2)
  name <- c("2YCHF","EURCHF")
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  mapping.table <- mappingTable(rate(name     = "2YCHF",
                                     currency = "CHF",
                                     horizon  = "k"),
                                rate(name     = "2YCHF",
                                     currency = "EUR",
                                     horizon  = "k",
                                     scale    = 0.75),
                                currency(name = "EURCHF",
                                         from = "EUR",
                                         to   = "CHF"))

  initial.values <- list()

  initial.values$initial.fx <- data.frame(from             = "EUR",
                                          to               = "CHF",
                                          fx               = 1.05,
                                          stringsAsFactors = F)

  initial.values$initial.rate <- data.frame(time             = c(1L, 1L),
                                            currency         = c("CHF", "EUR"),
                                            rate             = c(0.01, 0.01),
                                            stringsAsFactors = F)

  mapping.time <- data.frame(time = 1L, mapping = "k", stringsAsFactors = F)

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  corr.mat <- diag(c(1, 1))
  colnames(corr.mat) <- c("storno", "invalidity")
  rownames(corr.mat) <- colnames(corr.mat)
  hr <- lifeRisk(corr.mat = corr.mat, quantile = c(0.995, 0.995))

  l <- valInfo.life(life(name = c("storno", "invalidity"),
                               currency    = c("CHF", "EUR"),
                               sensitivity = c(12, 25)),
                    mr, hr)

  expect_equal(l, as.numeric(sqrt(t(c(12, 25 * 1.05)/qnorm(1 - c(0.995, 0.995))) %*%
                         corr.mat %*% (c(12, 25 * 1.05)/qnorm(1 - c(0.995, 0.995))))))

  l <- valInfo.life(life(name = c("invalidity"),
                         currency    = c("CHF"),
                         sensitivity = c(12)),
                    mr, hr)

  expect_equal(l, as.numeric(sqrt(t(c(12)/(qnorm(1 - c(0.995)))) *
                                    1 * (c(12)/(qnorm(1 - c(0.995)))))))

})

test_that("valExpression for life is OK", {

  ## a valid input
  cov.mat <- diag(2, 2, 2) %*% diag(rep(1, 2)) %*% diag(2, 2, 2)
  name <- c("2YCHF","EURCHF")
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  mapping.table <- mappingTable(rate(name     = "2YCHF",
                                     currency = "CHF",
                                     horizon  = "k"),
                                rate(name     = "2YCHF",
                                     currency = "EUR",
                                     horizon  = "k",
                                     scale    = 0.75),
                                currency(name = "EURCHF",
                                         from = "EUR",
                                         to   = "CHF"))

  initial.values <- list()

  initial.values$initial.fx <- data.frame(from             = "EUR",
                                          to               = "CHF",
                                          fx               = 1.05,
                                          stringsAsFactors = F)

  initial.values$initial.rate <- data.frame(time             = c(1L, 1L),
                                            currency         = c("CHF", "EUR"),
                                            rate             = c(0.01, 0.01),
                                            stringsAsFactors = F)

  mapping.time <- data.frame(time = 1L, mapping = "k", stringsAsFactors = F)

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  corr.mat <- diag(c(1, 1))
  colnames(corr.mat) <- c("storno", "invalidity")
  rownames(corr.mat) <- colnames(corr.mat)
  hr <- lifeRisk(corr.mat = corr.mat, quantile = c(0.995, 0.995))

  expect_equal(valExpression(life(name        = c("storno", "invalidity"),
                                  currency    = c("CHF", "EUR"),
                                  sensitivity = c(12, 25)),
                             mr, hr),
               paste(sqrt(t(c(12, 25 * 1.05)/(qnorm(1 - c(0.995, 0.995)))) %*% corr.mat %*%
                       (c(12, 25 * 1.05)/(qnorm(1 - c(0.995, 0.995))))),
                     "lifeSimulation", sep = " * "))



})
