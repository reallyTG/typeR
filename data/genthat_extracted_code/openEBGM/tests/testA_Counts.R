context("Count Output")
#For testing if the functions that calculate the count and other reporting
#measures work properly

#Process some raw data
dat <- data.frame(
  var1 = c("product_A", "product_B", "product_B", "product_B", "product_A",
           "product_A", "product_A", "product_A", "product_A", "product_B",
           "product_B", "product_A", "product_A", "product_B", "product_A",
           "product_A", "product_C", "product_C"),
  var2 = c("event_2", "event_1", "event_1", "event_2", "event_1", "event_1",
           "event_1", "event_1", "event_1", "event_1", "event_1", "event_1",
           "event_2", "event_2", "event_2", "event_1", "event_1", "event_3"),
  strat1 = c("M", "M", "F", "F", "F", "F", "M", "F", "F", "M", "M", "M", "M",
             "M", "F", "M", "M", "M"),
  strat2 = c("age_cat1", "age_cat2", "age_cat2", "age_cat2", "age_cat1",
             "age_cat1", "age_cat1", "age_cat2", "age_cat2", "age_cat2",
             "age_cat1", "age_cat2", "age_cat1", "age_cat1", "age_cat1",
             "age_cat2", "age_cat2", "age_cat1"),
  stringsAsFactors = FALSE
)
dat$id <- 1:nrow(dat)

dat_no_strat <- dat[, !grepl("strat", names(dat))]
dat_no_id    <- dat[, !grepl("id", names(dat))]
dat_missing1 <- dat
dat_missing1[3, "var1"] <- ""
dat_missing2 <- dat
dat_missing2[1, "var2"] <- ""
dat_missing3 <- dat
dat_missing3[2, "id"] <- NA
dat_missing4 <- dat
dat_missing4[2, "strat2"] <- ""

testthat::test_that("correct number of rows and columns from processRaw", {
  expect_equal(nrow(processRaw(dat)), 6)
  expect_equal(nrow(suppressWarnings(processRaw(dat, stratify = TRUE))), 6)
  expect_equal(nrow(processRaw(dat, zeroes = TRUE)), 9)
  expect_equal(nrow(suppressWarnings(processRaw(dat, zeroes = TRUE, stratify = TRUE))), 9)

  expect_equal(ncol(processRaw(dat)), 6)
  expect_equal(ncol(suppressWarnings(processRaw(dat, stratify = TRUE))), 6)
  expect_equal(ncol(processRaw(dat, zeroes = TRUE)), 6)
  expect_equal(ncol(suppressWarnings(processRaw(dat, zeroes = TRUE, stratify = TRUE))), 6)
})

testthat::test_that("correct column names from processRaw", {
  expect_match(paste0(names(processRaw(dat)), collapse = ""),
               "var1var2NERRPRR")
  expect_match(
    paste0(names(suppressWarnings(processRaw(dat, stratify = TRUE))), collapse = ""),
               "var1var2NERRPRR"
  )
  expect_match(
    paste0(names(processRaw(dat, zeroes = TRUE)), collapse = ""),
               "var1var2NERRPRR"
  )
  expect_match(
    paste0(names(suppressWarnings(processRaw(dat, zeroes = TRUE, stratify = TRUE))), collapse = ""),
               "var1var2NERRPRR"
  )
})

testthat::test_that("values returned from processRaw make sense", {
  expect_equal(max(processRaw(dat)$N), 7)
  expect_equal(max(suppressWarnings(processRaw(dat, stratify = TRUE))$N), 7)
  expect_equal(max(processRaw(dat, zeroes = TRUE)$N), 7)
  expect_equal(max(suppressWarnings(processRaw(dat, zeroes = TRUE, stratify = TRUE))$N), 7)
})

strat_error <- paste("at least one stratification variable contains more than 1 categories --",
                     "\n  did you remember to categorize stratification variables?",
                     "\n  if you really need more categories, increase 'max_cats'",
                     sep = "")

testthat::test_that("do warnings/errors get correctly printed?", {
  expect_error(processRaw(as.matrix(dat)),
               "'data' must be a data frame",
               fixed = TRUE)
  expect_error(processRaw(dat, stratify = 4),
               "'stratify', 'zeroes', & 'list_ids' must be logical values",
               fixed = TRUE)
  expect_error(processRaw(dat, zeroes = 4),
               "'stratify', 'zeroes', & 'list_ids' must be logical values",
               fixed = TRUE)
  expect_error(processRaw(dat, list_ids = 4),
               "'stratify', 'zeroes', & 'list_ids' must be logical values",
               fixed = TRUE)
  expect_error(processRaw(dat_no_id),
               "missing the appropriate column names (need 'id', 'var1', & 'var2')",
               fixed = TRUE)
  expect_error(processRaw(dat_missing1),
               "missing values are not allowed for 'id', 'var1', or 'var2'",
               fixed = TRUE)
  expect_error(processRaw(dat_missing2),
               "missing values are not allowed for 'id', 'var1', or 'var2'",
               fixed = TRUE)
  expect_error(processRaw(dat_missing3),
               "missing values are not allowed for 'id', 'var1', or 'var2'",
               fixed = TRUE)
  expect_error(processRaw(dat_no_strat, stratify = TRUE),
               "no stratification variables found",
               fixed = TRUE)
  expect_error(processRaw(dat_missing4, stratify = TRUE),
               "missing values are not allowed for stratification variables",
               fixed = TRUE)
  expect_message(suppressWarnings(processRaw(dat, stratify = TRUE)),
                 "stratification variables used: strat1, strat2",
                 fixed = TRUE)
  expect_error(processRaw(dat, stratify = TRUE, max_cats = 1),
               strat_error,
               fixed = TRUE)
  expect_message(suppressWarnings(processRaw(dat, stratify = TRUE)),
                 "there were 4 strata",
                 fixed = TRUE)
  expect_warning(processRaw(dat, stratify = TRUE),
                 "at least one stratum contains less than 50 unique IDs",
                 fixed = TRUE)
})

testthat::test_that("are PRR results the same regardless of stratification?", {
  expect_equal(processRaw(dat, digits = 3)$PRR,
               suppressWarnings(
                 processRaw(dat, stratify = TRUE, digits = 3))$PRR
               )
  expect_equal(processRaw(dat, zeroes = TRUE, digits = 3)$PRR,
               suppressWarnings(
                 processRaw(dat, stratify = TRUE, zeroes = TRUE, digits = 3))$PRR
               )
})

testthat::test_that("works with a single stratification variable?", {
  expect_error(suppressWarnings(processRaw(dat[, -4], stratify = TRUE)), NA)
})

#Examine if results are correct
results_unstr <- processRaw(dat, zeroes = TRUE, digits = 3)
results_str   <- suppressWarnings(
  suppressMessages(processRaw(dat, stratify = TRUE, zeroes = TRUE, digits = 3))
)

#Manually build unstratified results
var1s    <- sort(unique(dat$var1))
var2s    <- sort(unique(dat$var2))
num_var1 <- length(var1s)
num_var2 <- length(var2s)
dat_man <- data.frame(
  matrix(data = NA, nrow = num_var1 * num_var2, ncol = ncol(results_unstr))
  )
colnames(dat_man) <- colnames(results_unstr)
dat_man$var1 <- sort(rep(var1s, num_var2))
dat_man$var2 <- rep(sort(var2s), num_var1)
tot_sum <- length(unique(dat$id))
for (i in var1s) {
  row_sum <- nrow(dat[dat$var1 == i, ])
  for (j in var2s) {
    col_sum <- nrow(dat[dat$var2 == j, ])
    N <- nrow(dat[dat$var1 == i & dat$var2 == j, ])
    dat_man[dat_man$var1 == i & dat_man$var2 == j, "N"] <- N
    dat_man[dat_man$var1 == i & dat_man$var2 == j, "E"] <- (row_sum * col_sum) / tot_sum
    PRR_num <- N / row_sum
    PRR_den <- (col_sum - N) / (tot_sum - row_sum)
    dat_man[dat_man$var1 == i & dat_man$var2 == j, "PRR"] <- round(PRR_num / PRR_den, 3)
  }
}
dat_man$RR   <- round(dat_man$N / dat_man$E, 3)
dat_man$RR   <- ifelse(is.nan(dat_man$RR), 0, dat_man$RR)
dat_man$var1 <- as.factor(dat_man$var1)
dat_man$var2 <- as.factor(dat_man$var2)

dat_man_no_zero <- dat_man[dat_man$N !=0, ]
rownames(dat_man_no_zero) <- NULL

#Manually build stratified results
strat1s    <- sort(unique(dat$strat1))
strat2s    <- sort(unique(dat$strat2))
num_strat1 <- length(strat1s)
num_strat2 <- length(strat2s)
num_strats <- num_strat1 * num_strat2
num_rows   <- num_var1 * num_var2 * num_strat1 * num_strat2
cols <- c("strat1", "strat2", "var1", "var2", "N", "E")
dat_man2 <- data.frame(matrix(data = NA, nrow = num_rows, ncol = length(cols)))
colnames(dat_man2) <- cols
dat_man2$strat1 <- sort(rep(strat1s, num_strat2 * num_var1 * num_var2))
dat_man2$strat2 <- rep(sort(rep(strat2s, num_var1 * num_var2)), num_strat1)
dat_man2$var1 <- rep(sort(rep(var1s, num_var2)), num_strats)
dat_man2$var2 <- rep(var2s, num_var1 * num_strats)

for (si in strat1s) {
  for (sj in strat2s) {
    dat_strat <- dat[dat$strat1 == si & dat$strat2 == sj, ]
    strat_sum <- nrow(dat_strat)
    for (i in var1s) {
      row_sum <- nrow(dat_strat[dat_strat$var1 == i, ])
      for (j in var2s) {
        col_sum <- nrow(dat_strat[dat_strat$var2 == j, ])
        N <- nrow(dat_strat[dat_strat$var1 == i & dat_strat$var2 == j, ])
        dat_man2[dat_man2$strat1 == si & dat_man2$strat2 == sj &
                 dat_man2$var1 == i & dat_man2$var2 == j, "N"] <- N
        E <- (row_sum * col_sum) / strat_sum
        dat_man2[dat_man2$strat1 == si & dat_man2$strat2 == sj &
                 dat_man2$var1 == i & dat_man2$var2 == j, "E"] <- E
      }
    }
  }
}

dat_man2_N   <- aggregate(N ~ var1 + var2, data = dat_man2, FUN = sum)
dat_man2_E   <- aggregate(E ~ var1 + var2, data = dat_man2, FUN = sum)
dat_man2_all <- merge(dat_man2_N, dat_man2_E, by = c("var1", "var2"))
dat_man2_all$RR   <- round(dat_man2_all$N / dat_man2_all$E, 3)
dat_man2_all$RR   <- ifelse(is.nan(dat_man2_all$RR), 0, dat_man2_all$RR)
dat_man2_all$var1 <- as.factor(dat_man2_all$var1)
dat_man2_all$var2 <- as.factor(dat_man2_all$var2)

dat_man2_all_no_zero <- dat_man2_all[dat_man2_all$N !=0, ]
rownames(dat_man2_all_no_zero) <- NULL

testthat::test_that("does processRaw() give the expected results?", {
  expect_equal(dat_man,
               processRaw(dat, stratify = FALSE, zeroes = TRUE, digits = 3))
  expect_equal(dat_man_no_zero,
               processRaw(dat, stratify = FALSE, zeroes = FALSE, digits = 3))
  expect_equal(dat_man2_all,
               suppressWarnings(
                 processRaw(dat, stratify = TRUE, zeroes = TRUE, digits = 3))[, 1:5]
               )
  expect_equal(dat_man2_all_no_zero,
               suppressWarnings(
                 processRaw(dat, stratify = TRUE, zeroes = FALSE, digits = 3))[, 1:5]
               )
})

dat_table <- data.table::as.data.table(dat)
dat_tib <- dplyr::as_data_frame(dat)

testthat::test_that("does processRaw() work with data.tables and tibble_dfs?", {
    expect_equal(processRaw(dat), processRaw(dat_table))
    expect_equal(suppressWarnings(processRaw(dat, stratify = TRUE)),
                 suppressWarnings(processRaw(dat_table, stratify = TRUE)))
    expect_equal(suppressWarnings(processRaw(dat, stratify = TRUE, zeroes = TRUE)),
                 suppressWarnings(processRaw(dat_table, stratify = TRUE, zeroes = TRUE)))

    expect_equal(processRaw(dat), processRaw(dat_tib))
    expect_equal(suppressWarnings(processRaw(dat, stratify = TRUE)),
                 suppressWarnings(processRaw(dat_tib, stratify = TRUE)))
    expect_equal(suppressWarnings(processRaw(dat, stratify = TRUE, zeroes = TRUE)),
                 suppressWarnings(processRaw(dat_tib, stratify = TRUE, zeroes = TRUE)))
})

#Test to see if simple example gives expected results from hand calculation
dat2 <- data.frame(var1 = c("product_A", rep("product_B", 3), "product_C",
                            rep("product_A", 2), rep("product_B", 2), "product_C"),
                   var2 = c("event_1", rep("event_2", 2), rep("event_3", 2),
                            "event_2", rep("event_3", 3), "event_1"),
                   strat1 = c(rep("Male", 5), rep("Female", 3), rep("Male", 2)),
                   strat2 = c(rep("age_cat1", 5), rep("age_cat1", 3),
                              rep("age_cat2", 2))
                   )
dat2$id <- 1:nrow(dat2)

hand <- data.frame(var1 = c(rep("product_A", 3), rep("product_B", 3),
                            rep("product_C", 3)),
                   var2 = c(rep(c("event_1", "event_2", "event_3"), 3)),
                   N    = c(1, 1, 1, 0, 2, 3, 1, 0, 1),
                   E    = c(0.6, 0.9, 1.5, 1, 1.5, 2.5, 0.4, 0.6, 1),
                   RR   = c(1.6667, 1.1111, 0.6667, 0, 1.3333, 1.2, 2.5, 0, 1),
                   PRR  = c(2.3333, 1.1667, 0.5833, 0, 2, 1.5, 4, 0, 1)
                   )

testthat::test_that("results match hand calculations, unstratified", {
  expect_equal(processRaw(dat2, stratify = FALSE, zeroes = TRUE, digits = 4),
               hand)
  expect_equivalent(processRaw(dat2, stratify = FALSE, zeroes = FALSE, digits = 4),
               hand[hand$N != 0, ])
})

hand_s <- data.frame(
  var1 = c(rep("product_A", 3), rep("product_B", 3), rep("product_C", 3)),
  var2 = c(rep(c("event_1", "event_2", "event_3"), 3)),
  N    = c(1, 1, 1, 0, 2, 3, 1, 0, 1),
  E    = c(0.2, 0.4+2/3, 0.4+4/3, 1.1, 1.2+1/3, 1.7+2/3, 0.7, 0.4, 0.9),
  RR   = c(5, 0.9375, 0.5769, 0, 1.3043, 1.2676, 1.4286, 0, 1.1111),
  PRR  = c(2.3333, 1.1667, 0.5833, 0, 2, 1.5, 4, 0, 1)
)

testthat::test_that("results match hand calculations, stratified", {
  suppressWarnings(suppressMessages(
    expect_equal(processRaw(dat2, stratify = TRUE, zeroes = TRUE, digits = 4),
                 hand_s)
  ))
  suppressWarnings(suppressMessages(
    expect_equivalent(processRaw(dat2, stratify = TRUE, zeroes = FALSE, digits = 4),
                      hand_s[hand_s$N != 0, ])
  ))
})
