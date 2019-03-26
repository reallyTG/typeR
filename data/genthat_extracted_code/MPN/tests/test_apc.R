context("apc function - verify results")
#Test if the function apc() works properly.

# Error when incomplete gamma is essentially 1 ---------------------------------
test_that("TNTC plates are unlikely", {
  my_count <- c(10, 12, 23, 48, 63)
  my_amount_scor <- c(1, 1, 1, 5, 5)
  my_amount_tntc <- c(5, 10, 10, 1)
  my_tntc_limit <- 80
  expect_error(apc(my_count, my_amount_scor, my_amount_tntc, my_tntc_limit),
               paste("one or more of these TNTC plates are extremely",
                     "unlikely\nconsidering the observed scorable plates"),
               fixed = TRUE
  )
})

# What happens if no TNTC and all zeroes? --------------------------------------
test_that("all zeroes, no TNTC", {
  my_count <- c(0, 0)
  my_amount_scor <- c(1, 1)
  results <- apc(my_count, my_amount_scor)
  expect_equal(results$APC, expected = 0)
  expect_true(is.na(results$LB))
  expect_true(is.na(results$UB))
})

# Large point estimate ---------------------------------------------------------
test_that("large point estimate", {
  my_count       <- c(28, 20)          #Ni
  my_amount_scor <- 1 * c(.001, .001)  #Vi
  my_amount_tntc <- 1 * c(.01, .01)    #Vj
  my_tntc_limit  <- c(300, 250)        #NLj
  my_apc <- apc(my_count, my_amount_scor, my_amount_tntc, my_tntc_limit)
  expect_equal(my_apc$APC, expected = 30183.83, tolerance = 10)
  expect_equal(my_apc$LB, expected = 26792.25, tolerance = 10)
  expect_equal(my_apc$UB, expected = 34963.34, tolerance = 10)
})

# "Averaging of TNTC Counts" (Haas & Heller, 1988) -----------------------------

test_that("Haas & Heller (1988) example", {
  my_count <- c(10, 12, 23, 48, 63)
  my_amount_scor <- c(1, 1, 1, 5, 5)
  my_amount_tntc <- c(5, 10, 10)
  my_tntc_limit <- 80
  results <- apc(my_count, my_amount_scor, my_amount_tntc, my_tntc_limit)
  expect_equal(results$APC, expected = 13.28, tolerance = .1)
})

# "Quantitative Microbial Risk Assessment" (Haas et al., 2014) -----------------

test_that("Haas (2014) Example 6.1A", {
  ex61a_count       <- c(1, 2, 1, 0, 0, 1, 1, 3, 6, 8, 4)
  ex61a_amount_scor <- c(1, 1, 1, 1, 1, 2.5, 2.5, 2.5, 2.5, 5, 5)
  ex61a <- apc(ex61a_count, ex61a_amount_scor)
  expect_equal(ex61a$APC, expected = 1.08, tolerance = 0.01)  #p.163
})

test_that("Haas (2014) Example 6.1B", {
  ex61b_count       <- c(1, 0, 5, 1, 0, 5, 0, 1, 5, 1, 8)
  ex61b_amount_scor <- c(1, 1, 1, 1, 1, 2.5, 2.5, 2.5, 2.5, 5, 5)
  ex61b <- apc(ex61b_count, ex61b_amount_scor)
  expect_equal(ex61b$APC, expected = 1.08, tolerance = .01)  #p.163
})

test_that("Haas (2014) Example 6.2", {
  ex62_count       <- c(12, 8, 15, 40, 58)
  ex62_amount_scor <- c(1, 1, 1, 10, 10)
  ex62_amount_tntc <- c(10, 100, 100, 100)
  ex62_tntc_limit  <- 100
  ex62 <- apc(ex62_count, ex62_amount_scor, ex62_amount_tntc, ex62_tntc_limit)
  expect_equal(ex62$APC, expected = 7, tolerance = .5)  #p.163
  expect_equal(ex62$LB, expected = 6.03, tolerance = .01)  #p.185
  expect_equal(ex62$UB, 7.96, tolerance = .01)
})

# BAM (no TNTC) ----------------------------------------------------------------
test_that("BAM - One plate", {
  bam1_count       <- 27
  bam1_amount_scor <- 1 * (1 / 100)
  bam1 <- apc(bam1_count, bam1_amount_scor)
  expect_equal(signif(bam1$APC, 2), expected = 2700)
})

test_that("BAM - Two plates, none TNTC, same dilution", {
  bam2_count       <- c(27, 51)
  bam2_amount_scor <- rep((1 / 100) * 1, 2)
  bam2 <- apc(bam2_count, bam2_amount_scor)
  expect_equal(signif(bam2$APC, 2), expected = 3900)
})

test_that("BAM - Two plates, none TNTC, different dilutions", {
  bam3_count       <- c(120, 23)
  bam3_amount_scor <- 1 * c(1 / 100, 1 / 1000)
  bam3 <- apc(bam3_count, bam3_amount_scor)
  expect_equal(signif(bam3$APC, 2), expected = 13000)
})

test_that("BAM - Four plates, none TNTC, two dilutions", {
  bam4_count       <- c(144, 118, 26, 20)
  bam4_amount_scor <- 1 * c(1/100, 1/100, 1/1000, 1/1000)
  bam4 <- apc(bam4_count, bam4_amount_scor)
  expect_equal(signif(bam4$APC, 2), expected = 14000)
})
