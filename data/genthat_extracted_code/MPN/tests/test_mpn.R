context("mpn function - verify results")
#Test if the function mpn() works properly.

# Quick comparison table -------------------------------------------------------

test_that("APHA quick table - MPN point estimates correct", {
  tubes1 <- c(3, 3, 3)
  amount <- c(10, 1, .1)
  expect_equal(
    signif(mpn(positive = c(1, 1, 1), tubes = tubes1, amount = amount)$MPN, 2),
    .11
  )
  expect_equal(
    signif(mpn(positive = c(2, 1, 0), tubes = tubes1, amount = amount)$MPN, 2),
    .15
  )
  expect_equal(
    signif(mpn(positive = c(3, 1, 0), tubes = tubes1, amount = amount)$MPN, 2),
    .43
  )
  tubes2 <- c(5, 5, 5)
  expect_equal(
    signif(mpn(positive = c(1, 1, 1), tubes = tubes2, amount = amount)$MPN, 2),
    .061
  )
  expect_equal(
    signif(mpn(positive = c(2, 1, 0), tubes = tubes2, amount = amount)$MPN, 2),
    .068
  )
  expect_equal(
    signif(mpn(positive = c(3, 1, 0), tubes = tubes2, amount = amount)$MPN, 2),
    .11
  )
  expect_equal(
    signif(mpn(positive = c(5, 2, 0), tubes = tubes2, amount = amount)$MPN, 2),
    .49
  )
})


# Blodgett's articles ----------------------------------------------------------

test_that("Blodgett - MPN & RI match spreadsheet", {
  amount <- c(.1, .01, .001)
  x <- mpn(positive = c(5, 3, 0), tubes = c(10, 10, 10), amount = amount)
  expect_equal(x$MPN, 9.950764229, tol = .001)
  expect_equal(x$RI, .0924576, tol = .001)

  y <- mpn(positive = c(4, 2, 2), tubes = c(5, 5, 4), amount = amount)
  expect_equal(y$MPN, 31.918, tol = .002)
  expect_equal(y$RI, 1.02e-3, tol = .0005)

  z <- mpn(positive = c(3, 0, 2), tubes = c(7, 5, 7), amount = amount)
  expect_equal(z$MPN, 8.549, tol = .002)
  expect_equal(z$RI, 1.15e-3, tol = .0005)

  q <- mpn(positive = c(2, 3, 4), tubes = c(9, 3, 4), amount = amount)
  expect_equal(q$MPN, 11.274, tol = .002)
  expect_equal(q$RI, 6.34e-13, tol = 1e-12)
})

test_that("Blodgett - MPN matches Table 1, Blodgett (2002)", {
  tubes  <- c(5, 5)
  amount <- c(1, .1)
  expect_equal(mpn(positive = c(1, 5), tubes = tubes, amount = amount)$MPN,
               1.29, tol = .01)
  expect_equal(mpn(positive = c(2, 4), tubes = tubes, amount = amount)$MPN,
               1.48, tol = .01)
  expect_equal(mpn(positive = c(3, 3), tubes = tubes, amount = amount)$MPN,
               1.75, tol = .01)
  expect_equal(mpn(positive = c(4, 2), tubes = tubes, amount = amount)$MPN,
               2.21, tol = .01)
  expect_equal(mpn(positive = c(5, 1), tubes = tubes, amount = amount)$MPN,
               3.48, tol = .01)
})

test_that("Blodgett - RI matches Table 4, Blodgett (2002)", {
  tubes  <- c(5, 5, 5)
  amount <- c(1, .1, .01)
  expect_equal(mpn(positive = c(3, 0, 0), tubes = tubes, amount = amount)$RI,
               1, tol = .001)
  expect_equal(mpn(positive = c(2, 1, 0), tubes = tubes, amount = amount)$RI,
               .354, tol = .01)
  expect_equal(mpn(positive = c(0, 4, 1), tubes = tubes, amount = amount)$RI,
               5.85e-07, tol = 1e-07)
  expect_equal(mpn(positive = c(3, 4, 0), tubes = tubes, amount = amount)$RI,
               2.51e-03, tol = 1e-04)
  expect_equal(mpn(positive = c(3, 3, 1), tubes = tubes, amount = amount)$RI,
               2.34e-03, tol = 1e-04)
  expect_equal(mpn(positive = c(0, 2, 5), tubes = tubes, amount = amount)$RI,
               2.91e-13, tol = 1e-14)
})


# Jarvis (2010) ----------------------------------------------------------------

test_that("Jarvis - some positive, some negative", {
  #Table 1
  x <- mpn(positive = c(2, 2, 0), tubes = c(3, 3, 3), amount = c(1, .1, .01),
           CI_method = "Jarvis")
  expect_equal(x$MPN, 2.1, tol = .1)
  expect_equal(x$LB, .71, tol = .025)
  expect_equal(x$UB, 6.2, tol = .1)
  expect_equal(x$RI, .069, tol = .001)

  y <- mpn(positive = c(3, 1, 1), tubes = c(3, 3, 3), amount = c(1, .1, .01),
           CI_method = "Jarvis")
  expect_equal(y$MPN, 7.5, tol = .1)
  expect_equal(y$LB, 1.9, tol = .1)
  expect_equal(y$UB, 30, tol = 1)
  expect_equal(y$RI, .209, tol = .001)

  #Table 2
  z <- mpn(positive = c(50, 34, 7), tubes = c(50, 49, 49),
           amount = 2 * c(1, .1, .01), CI_method = "Jarvis")
  expect_equal(z$MPN, 6.2, tol = .1)
  expect_equal(z$LB, 4.5, tol = .1)
  expect_equal(z$UB, 8.6, tol = .1)
  expect_equal(z$RI, .746, tol = .001)
})

test_that("Jarvis - all negative tubes", {
  #Jarvis Table 1
  x <- mpn(positive = c(0, 0, 0), tubes = c(3, 3, 3), amount = c(1, .1 , .01),
           conf_level = .975, CI_method = "Jarvis")  #Jarvis used alpha / 2
  expect_equal(x$MPN, 0)
  expect_equal(x$variance, NA)
  expect_equal(x$var_log, NA)
  expect_equal(x$LB, 0)
  expect_equal(x$UB, 1.1, tol = .1)
  expect_equal(x$RI, 1)
})

test_that("Jarvis - all positive tubes", {
  #Table 1
  x <- mpn(positive = c(3, 3, 3), tubes = c(3, 3, 3), amount = c(1, .1, .01),
           conf_level = .975, CI_method = "Jarvis")  #Jarvis used alpha / 2
  expect_true(is.infinite(x$MPN))
  expect_true(is.na(x$variance))
  expect_true(is.na(x$var_log))
  expect_equal(x$LB, 36, tol = .05)
  expect_true(is.infinite(x$UB))
  expect_equal(x$RI, 1)
})


# BAM tables -------------------------------------------------------------------

test_that("BAM tables - some positive, some negative", {
  amount <- c(.1, .01, .001)
  #Table 1
  tubes1 <- c(3, 3, 3)
  x1 <- mpn(positive = c(0, 0, 1), tubes = tubes1, amount = amount)
  expect_equal(signif(x1$MPN, 2), 3.0, tol = .001)
  y1 <- mpn(positive = c(1, 1, 1), tubes = tubes1, amount = amount)
  expect_equal(signif(y1$MPN, 2), 11, tol = .001)
  z1 <- mpn(positive = c(2, 2, 0), tubes = tubes1, amount = amount)
  expect_equal(signif(z1$MPN, 2), 21, tol = .001)
  q1 <- mpn(positive = c(3, 3, 2), tubes = tubes1, amount = amount)
  expect_equal(signif(q1$MPN, 2), 1100, tol = .001)

  #Table 2
  tubes2 <- c(5, 5, 5)
  x2 <- mpn(positive = c(0, 0, 1), tubes = tubes2, amount = amount)
  expect_equal(signif(x2$MPN, 2), 1.8, tol = .001)
  y2 <- mpn(positive = c(1, 2, 0), tubes = tubes2, amount = amount)
  expect_equal(signif(y2$MPN, 2), 6.1, tol = .001)
  z2 <- mpn(positive = c(4, 0, 2), tubes = tubes2, amount = amount)
  expect_equal(signif(z2$MPN, 2), 21, tol = .001)
  q2 <- mpn(positive = c(5, 5, 4), tubes = tubes2, amount = amount)
  expect_equal(signif(q2$MPN, 2), 1600, tol = .001)

  #Table 3
  tubes3 <- c(10, 10, 10)
  x3 <- mpn(positive = c(0, 0, 1), tubes = tubes3, amount = amount)
  expect_equal(signif(x3$MPN, 2), 0.9, tol = .001)
  y3 <- mpn(positive = c(3, 2, 2), tubes = tubes3, amount = amount)
  expect_equal(signif(y3$MPN, 2), 7.5, tol = .001)
  z3 <- mpn(positive = c(8, 2, 0), tubes = tubes3, amount = amount)
  expect_equal(signif(z3$MPN, 2), 17, tol = .001)
  q3 <- mpn(positive = c(10, 10, 9), tubes = tubes3, amount = amount)
  expect_equal(signif(q3$MPN, 2), 2300, tol = .001)

  #Table 5
  x4 <- mpn(positive = 1, tubes = 10, amount = 10)
  expect_equal(signif(100 * x4$MPN, 2), 1.1, tol = .01)
  y4 <- mpn(positive = 5, tubes = 10, amount = 10)
  expect_equal(signif(100 * y4$MPN, 2), 6.9, tol = .01)
  z4 <- mpn(positive = 9, tubes = 10, amount = 10)
  expect_equal(signif(100 * z4$MPN, 2), 23, tol = .1)
})


# Quant. Micro. Risk Assessment - Ch.6 (Haas, 2014) ----------------------------

test_that("Haas et al. - Quant. Micro. Risk Assessment (2014)", {
  #Ex.6.4 (p.166)
  x <- mpn(positive = c(5, 3, 0), tubes = c(5, 5, 5), amount = c(10, 1, .1))
  expect_equal(x$MPN, .792, tol = .001)
  #p.178
  y1 <- mpn(positive = c(6, 2, 1, 0), tubes = c(10, 10, 10, 10),
            amount = c(10, 1, .1, .01))
  expect_equal(y1$MPN, .1215, tol = .001)
  y2 <- mpn(positive = c(4, 3, 1, 3), tubes = c(10, 10, 10, 10),
            amount = c(10, 1, .1, .01))
  expect_equal(y2$MPN, .1289, tol = .0005)
  #Ex.6.9 (p.179)
  z <- mpn(positive = c(7, 4, 3, 4, 2, 2, 2),
           tubes = c(29, 30, 28, 30, 29, 25, 30),
           amount = c(.032, .026, .021, .018, .016, .011, .005))
  expect_equal(z$MPN, 6.949, tol = .001)
})


# Ridout (1994) ----------------------------------------------------------------
test_that("Ridout - A Comparison of Confidence...", {
  #Table 1 - LR approach
  my_tubes  <- c(3, 3, 3)
  my_amount <- c(.1, .01, .001)
  x1 <- mpn(positive = c(0, 0, 0), tubes = my_tubes, amount = my_amount,
            CI_method = "LR")
  expect_equal(x1$MPN, 0, tol = .001)
  expect_equal(x1$LB, 0, tol = .001)
  expect_equal(x1$UB, 9.0, tol = .05)
  x2 <- mpn(positive = c(0, 1, 0), tubes = my_tubes, amount = my_amount,
            CI_method = "LR")
  expect_equal(x2$MPN, 3.1, tol = .05)
  expect_equal(x2$LB, .2, tol = .05)
  expect_equal(x2$UB, 13.4, tol = .05)
  x3 <- mpn(positive = c(1, 0, 0), tubes = my_tubes, amount = my_amount,
            CI_method = "LR")
  expect_equal(x3$MPN, 3.6, tol = .05)
  expect_equal(x3$LB, .2, tol = .05)
  expect_equal(x3$UB, 16.0, tol = .05)
  x4 <- mpn(positive = c(1, 1, 0), tubes = my_tubes, amount = my_amount,
            CI_method = "LR")
  expect_equal(x4$MPN, 7.4, tol = .05)
  expect_equal(x4$LB, 1.2, tol = .05)
  expect_equal(x4$UB, 23.3, tol = .05)
  x5 <- mpn(positive = c(2, 0, 0), tubes = my_tubes, amount = my_amount,
            CI_method = "LR")
  expect_equal(x5$MPN, 9.2, tol = .05)
  expect_equal(x5$LB, 1.5, tol = .05)
  expect_equal(x5$UB, 30.6, tol = .05)
  x6 <- mpn(positive = c(2, 0, 1), tubes = my_tubes, amount = my_amount,
            CI_method = "LR")
  expect_equal(x6$MPN, 14.3, tol = .05)
  expect_equal(x6$LB, 3.4, tol = .05)
  expect_equal(x6$UB, 40.5, tol = .05)
  x7 <- mpn(positive = c(2, 1, 0), tubes = my_tubes, amount = my_amount,
            CI_method = "LR")
  expect_equal(x7$MPN, 14.7, tol = .05)
  expect_equal(x7$LB, 3.5, tol = .05)
  expect_equal(x7$UB, 41.8, tol = .05)
  x8 <- mpn(positive = c(2, 2, 0), tubes = my_tubes, amount = my_amount,
            CI_method = "LR")
  expect_equal(x8$MPN, 21.1, tol = .05)
  expect_equal(x8$LB, 6.2, tol = .05)
  expect_equal(x8$UB, 54.3, tol = .05)
  x9 <- mpn(positive = c(3, 0, 0), tubes = my_tubes, amount = my_amount,
            CI_method = "LR")
  expect_equal(x9$MPN, 23.1, tol = .05)
  expect_equal(x9$LB, 4.9, tol = .05)
  expect_equal(x9$UB, 90.8, tol = .05)
  x10 <- mpn(positive = c(3, 0, 1), tubes = my_tubes, amount = my_amount,
            CI_method = "LR")
  expect_equal(x10$MPN, 38.5, tol = .05)
  expect_equal(x10$LB, 9.3, tol = .05)
  expect_equal(x10$UB, 139.1, tol = .05)
  x11 <- mpn(positive = c(3, 1, 0), tubes = my_tubes, amount = my_amount,
             CI_method = "LR")
  expect_equal(x11$MPN, 42.7, tol = .05)
  expect_equal(x11$LB, 9.8, tol = .05)
  expect_equal(x11$UB, 164.7, tol = .05)
  x12 <- mpn(positive = c(3, 1, 1), tubes = my_tubes, amount = my_amount,
             CI_method = "LR")
  expect_equal(x12$MPN, 74.9, tol = .05)
  expect_equal(x12$LB, 17.5, tol = .05)
  expect_equal(x12$UB, 235.4, tol = .05)
  x13 <- mpn(positive = c(3, 2, 0), tubes = my_tubes, amount = my_amount,
             CI_method = "LR")
  expect_equal(x13$MPN, 93.3, tol = .05)
  expect_equal(x13$LB, 19.8, tol = .05)
  expect_equal(x13$UB, 311.0, tol = .05)
  x14 <- mpn(positive = c(3, 2, 1), tubes = my_tubes, amount = my_amount,
             CI_method = "LR")
  expect_equal(x14$MPN, 149.4, tol = .05)
  expect_equal(x14$LB, 36.8, tol = .05)
  expect_equal(x14$UB, 425.7, tol = .05)
  x15 <- mpn(positive = c(3, 2, 2), tubes = my_tubes, amount = my_amount,
             CI_method = "LR")
  expect_equal(x15$MPN, 214.7, tol = .05)
  expect_equal(x15$LB, 62.9, tol = .05)
  expect_equal(x15$UB, 554.8, tol = .05)
  x16 <- mpn(positive = c(3, 3, 0), tubes = my_tubes, amount = my_amount,
             CI_method = "LR")
  expect_equal(x16$MPN, 239.8, tol = .05)
  expect_equal(x16$LB, 51.0, tol = .05)
  expect_equal(x16$UB, 975.0, tol = .05)
  x17 <- mpn(positive = c(3, 3, 1), tubes = my_tubes, amount = my_amount,
             CI_method = "LR")
  expect_equal(x17$MPN, 462.2, tol = .05)
  expect_equal(x17$LB, 102.5, tol = .05)
  expect_equal(x17$UB, 1848.5, tol = .05)
  x18 <- mpn(positive = c(3, 3, 2), tubes = my_tubes, amount = my_amount,
             CI_method = "LR")
  expect_equal(x18$MPN, 1099.0, tol = .05)
  expect_equal(x18$LB, 218.8, tol = .05)
  expect_equal(x18$UB, 3784.9, tol = .05)
  x19 <- mpn(positive = c(3, 3, 3), tubes = my_tubes, amount = my_amount,
             CI_method = "LR")
  expect_true(is.infinite(x19$MPN))
  expect_equal(x19$LB, 465.1, tol = .05)
  expect_true(is.infinite(x19$UB))
})


# Bias adjusted point estimate (Salama et al., 1978; Haas, 1989) ----------------

test_that("worksheet bias adjustment example", {
  x <- mpn(positive = c(5, 3, 0), tubes = c(5, 5, 5), amount = c(10, 1, .1))
  expect_equal(x$MPN_adj, expected = 0.67, tolerance = .01)
})

test_that("Salama et al. (1978) adjustment", {

  #What if all positive?
  x <- mpn(positive = c(2, 2), tubes = c(2, 2), amount = c(1, .1))
  expect_true(is.infinite(x$MPN))
  expect_true(is.na(x$MPN_adj))

  #Table 1 (Haas, 1989)
  my_tubes  <- c(5, 5, 5)
  my_amount <- c(10, 1, .1)
  my_tol    <-  .005
  x1 <- mpn(positive = c(0, 0, 0), tubes = my_tubes, amount = my_amount)
  expect_equal(x1$MPN, 0, tol = my_tol)
  expect_equal(x1$MPN_adj, 0, tol = my_tol)
  x2 <- mpn(positive = c(0, 0, 1), tubes = my_tubes, amount = my_amount)
  expect_equal(x2$MPN, .02, tol = my_tol)
  expect_equal(x2$MPN_adj, .02, tol = my_tol)
  x3 <- mpn(positive = c(0, 1, 0), tubes = my_tubes, amount = my_amount)
  expect_equal(x3$MPN, .02, tol = my_tol)
  expect_equal(x3$MPN_adj, .02, tol = my_tol)
  x4 <- mpn(positive = c(0, 2, 0), tubes = my_tubes, amount = my_amount)
  expect_equal(x4$MPN, .04, tol = my_tol)
  expect_equal(x4$MPN_adj, .03, tol = my_tol)
  x5 <- mpn(positive = c(1, 1, 1), tubes = my_tubes, amount = my_amount)
  expect_equal(x5$MPN, .06, tol = my_tol)
  expect_equal(x5$MPN_adj, .05, tol = my_tol)
  x6 <- mpn(positive = c(3, 2, 0), tubes = my_tubes, amount = my_amount)
  expect_equal(x6$MPN, .14, tol = my_tol)
  expect_equal(x6$MPN_adj, .12, tol = my_tol)
  x7 <- mpn(positive = c(5, 0, 2), tubes = my_tubes, amount = my_amount)
  expect_equal(x7$MPN, .43, tol = my_tol)
  expect_equal(x7$MPN_adj, .30, tol = my_tol)
  x8 <- mpn(positive = c(5, 4, 3), tubes = my_tubes, amount = my_amount)
  expect_equal(x8$MPN, 2.78, tol = my_tol)
  expect_equal(x8$MPN_adj, 2.05, tol = my_tol)
  x9 <- mpn(positive = c(5, 5, 4), tubes = my_tubes, amount = my_amount)
  expect_equal(x9$MPN, 16.09, tol = my_tol)
  expect_equal(x9$MPN_adj, 12.09, tol = my_tol)

  #Table 2 (Haas, 1989)
  my_tubes2  <- c(5, 5, 5, 5)
  my_amount2 <- c(10, 1, .1, .01)
  x10 <- mpn(positive = c(0, 0, 0, 0), tubes = my_tubes2, amount = my_amount2)
  expect_equal(x10$MPN, 0, tol = my_tol)
  expect_equal(x10$MPN_adj, 0, tol = my_tol)
  x11 <- mpn(positive = c(0, 0, 1, 0), tubes = my_tubes2, amount = my_amount2)
  expect_equal(x11$MPN, .02, tol = my_tol)
  expect_equal(x11$MPN_adj, .02, tol = my_tol)
  x12 <- mpn(positive = c(1, 2, 0, 0), tubes = my_tubes2, amount = my_amount2)
  expect_equal(x12$MPN, .06, tol = my_tol)
  expect_equal(x12$MPN_adj, .05, tol = my_tol)
  x13 <- mpn(positive = c(3, 1, 1, 0), tubes = my_tubes2, amount = my_amount2)
  expect_equal(x13$MPN, .14, tol = my_tol)
  expect_equal(x13$MPN_adj, .12, tol = my_tol)
  x14 <- mpn(positive = c(5, 2, 1, 1), tubes = my_tubes2, amount = my_amount2)
  expect_equal(x14$MPN, .92, tol = my_tol)
  expect_equal(x14$MPN_adj, .80, tol = my_tol)
  x15 <- mpn(positive = c(5, 5, 4, 4), tubes = my_tubes2, amount = my_amount2)
  expect_equal(x15$MPN, 34.54, tol = my_tol)
  expect_equal(x15$MPN_adj, 23.70, tol = my_tol)
  x16 <- mpn(positive = c(5, 5, 5, 4), tubes = my_tubes2, amount = my_amount2)
  expect_equal(x16$MPN, 160.94, tol = my_tol)
  expect_equal(x16$MPN_adj, 120.93, tol = my_tol)

  #Table 5 (Haas, 1989)
  x17 <- mpn(positive = c(4, 1, 0, 0), tubes = my_tubes2, amount = my_amount2)
  expect_equal(x17$MPN, .1680, tol = .001)
  expect_equal(x17$MPN_adj, .1405, tol = .001)
  x18 <- mpn(positive = c(3, 0, 0, 0), tubes = my_tubes2, amount = my_amount2)
  expect_equal(x18$MPN, .0777, tol = .001)
  expect_equal(x18$MPN_adj, .0688, tol = .001)
})
