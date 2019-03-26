context("stepFit")

source(system.file("tests/comparisons/localEst.R", package = "stepR"))
source(system.file("tests/comparisons/localCost.R", package = "stepR"))

# confidence intervals
testConfInt <- function(s, b, x, n, tolerance = 1e-9) {
  # end vectors
  expect_identical(s$leftEnd, x[s$leftIndex])
  expect_identical(s$rightEnd, x[s$rightIndex])
  expect_identical(s$leftEndLeftBound, x[s$leftIndexLeftBound])
  expect_identical(s$leftEndRightBound, x[s$leftIndexRightBound])
  expect_identical(s$rightEndLeftBound, x[s$rightIndexLeftBound])
  expect_identical(s$rightEndRightBound, x[s$rightIndexRightBound])
  
  L <- s$leftIndexLeftBound[-1]
  R <- s$leftIndexRightBound[-1]
  K <- length(L)
  
  expect_identical(s$leftIndexLeftBound[1], 1L)
  expect_identical(s$leftIndexRightBound[1], 1L)
  
  # test L
  if (K > 0L) {
    expect_true(max(c(-Inf, b$lower[b$li >= L[K]]))     <=
                  min(c(Inf, b$upper[b$li >= L[K]]))      + tolerance)
    expect_true(max(c(-Inf, b$lower[b$li >= L[K] - 1L])) >
                  min(c(Inf, b$upper[b$li >= L[K] - 1L])) - tolerance)
    
    if (K > 1L) {
      for (i in (K - 1L):1L) {
        # L[i] can be reached from L[i + 1] - 1
        expect_true(max(c(-Inf, b$lower[b$li >= L[i] & b$ri <= L[i + 1] - 1L])) <=
                      min(c( Inf, b$upper[b$li >= L[i] & b$ri <= L[i + 1] - 1L])) + tolerance)
        # L[i] - 1 cannot be reached from L[i + 1] - 1
        expect_true(max(c(-Inf, b$lower[b$li >= L[i] - 1L & b$ri <= L[i + 1] - 1L])) > 
                      min(c( Inf, b$upper[b$li >= L[i] - 1L & b$ri <= L[i + 1] - 1L])) - tolerance)
      }
    }
    
    expect_true(max(c(-Inf, b$lower[b$ri <= L[1] - 1L])) <=
                  min(c(Inf, b$upper[b$ri <= L[1] - 1L])) + tolerance)
  } else {
    expect_true(max(b$lower) <= min(b$upper) + tolerance)
  }
  
  # test R
  if (K > 0L) {
    expect_true(max(c(-Inf, b$lower[b$ri <= R[1]]))       >
                  min(c(Inf, b$upper[b$ri <= R[1]]))      - tolerance)
    expect_true(max(c(-Inf, b$lower[b$ri <= R[1] - 1L])) <=
                  min(c(Inf, b$upper[b$ri <= R[1] - 1L])) + tolerance)
    
    if (K > 1L) {
      for (i in 2:K) {
        # R[i] cannot be reached
        expect_true(max(c(-Inf, b$lower[b$li >= R[i - 1] & b$ri <= R[i]])) >
                      min(c( Inf, b$upper[b$li >= R[i - 1] & b$ri <= R[i]])) - tolerance)
        # R[i] - 1 can be reached
        expect_true(max(c(-Inf, b$lower[b$li >= R[i - 1] & b$ri <= R[i] - 1L])) <=
                      min(c( Inf, b$upper[b$li >= R[i - 1] & b$ri <= R[i] - 1L])) + tolerance)
      }
    }
    
    expect_true(max(c(-Inf, b$lower[b$li >= R[K]])) <=
                  min(c(Inf, b$upper[b$li >= R[K]])) + tolerance)
  }
  
  # test s$rightIndexLeftBound and s$rightIndexRightBound
  expect_identical(s$rightIndexLeftBound,  c(s$leftIndexLeftBound[-1]  - 1L, n))
  expect_identical(s$rightIndexRightBound, c(s$leftIndexRightBound[-1] - 1L, n))
}

# feasibility of the solution
testFeasible <- function(s, b, tolerance = 1e-9) {
  for (i in 1:length(s$leftIndex)) {
    expect_true(max(c(-Inf, b$lower[b$li >= s$leftIndex[i] & b$ri <=
                                      s$rightIndex[i]])) <= s$value[i] + tolerance)
    expect_true(min(c( Inf, b$upper[b$li >= s$leftIndex[i] & b$ri <=
                                      s$rightIndex[i]])) >= s$value[i] - tolerance)
  }
}

# test function values
testValues <- function(s, b, localEst, y, tolerance = 1e-9, ...) {
  for (i in 1:length(s$leftIndex)) {
    lower <- max(c(-Inf, b$lower[b$li >= s$leftIndex[i] & b$ri <= s$rightIndex[i]])) 
    upper <- min(c( Inf, b$upper[b$li >= s$leftIndex[i] & b$ri <= s$rightIndex[i]]))
    test <- localEst(y, s$leftIndex[i], s$rightIndex[i], lower, upper,
                     s$leftIndex, s$rightIndex, s$value, ...)
    expect_equal(s$value[i], localEst(y, s$leftIndex[i], s$rightIndex[i], lower, upper,
                                      s$leftIndex, s$rightIndex, s$value, ...),
                 tolerance = tolerance)
  }
}

# test optimality and costs
costSolution <- function(y, left, right, est, localCost, ...) {
  costs <- 0
  for (i in 1:length(left)) {
    costs <- costs + localCost(y, left[i], right[i], est[i], left, right, est, ...)
  }
  costs
}

# also included in testOptimality, only useful if testOptimality is skipped due to its runtime
testCosts <- function(s, y, localCost, tolerance = 1e-9, ...) {
  opt <- costSolution(y, s$leftIndex, s$rightIndex, s$value, localCost, ...)
  expect_equal(attr(s, "cost"), opt, tolerance = tolerance)
}

testOptimality <- function(s, b, y, localCost, localEst, tolerance = 1e-9, ...) {
  left <- s$leftIndexLeftBound
  est <- numeric(length(left))
  
  opt <- costSolution(y, s$leftIndex, s$rightIndex, s$value, localCost, ...)
  expect_equal(attr(s, "cost"), opt, tolerance = tolerance)
  
  if (length(left) > 1L) {
    while (left[length(left)] <= s$leftIndexRightBound[length(left)]) {
      right <- c(left[-1] - 1L, length(y))
      feas <- TRUE  
      # check feasibility
      for (i in 1:length(left)) {
        lower <- max(c(-Inf, b$lower[b$li >= left[i] & b$ri <= right[i]])) 
        upper <- min(c( Inf, b$upper[b$li >= left[i] & b$ri <= right[i]]))
        if (upper < lower) {
          feas <- FALSE
          break
        } else {
          est[i] <- localEst(y, left[i], right[i], lower, upper, left, right, est, ...)
        }
      }
      
      # compare cost of the solution
      if (feas && !identical(s$leftIndex, left)) {
        expect_true(costSolution(y, left, right, est, localCost, ...) >= opt - tolerance)
      }
      
      
      left[2] <- left[2] + 1L
      if (length(left) > 2L) {
        for (i in 2:(length(left) - 1L)) {
          if (left[i] > s$leftIndexRightBound[i]) {
            left[i + 1] <- left[i + 1] + 1L
            left[i] <- s$leftIndexLeftBound[i]
          }
        }        
      }
    }
  }
}

# confidence band
testBand <- function(s, b, x, tolerance = 1e-9) {
  band <- confband(s)
  expect_identical(band$x, x)
  
  leftconst <- s$leftIndexRightBound
  rightconst <- s$rightIndexLeftBound
  for (i in 1:length(leftconst)) {
    if (rightconst[i] >= leftconst[i]) {
      lower <- max(c(-Inf, b$lower[b$li >= leftconst[i] & b$ri <= rightconst[i]]))
      upper <- min(c( Inf, b$upper[b$li >= leftconst[i] & b$ri <= rightconst[i]]))    
      for (j in leftconst[i]:rightconst[i]) {
        expect_true((band$lower[j] == -Inf && lower == -Inf) || 
                      all.equal(lower, band$lower[j], tolerance = tolerance))
        expect_true((band$upper[j] ==  Inf && upper ==  Inf) || 
                      all.equal(upper, band$upper[j], tolerance = tolerance))
      }
    }
  }
  
  if (length(s$leftIndexLeftBound[-1]) > 0L) {
    for (i in 1:length(s$leftIndexLeftBound[-1])) {
      if (s$rightIndexRightBound[i] >= s$leftIndexLeftBound[i + 1]) {
        for (j in s$leftIndexLeftBound[i + 1]:s$rightIndexRightBound[i]) {
          lower <- min(max(c(-Inf, b$lower[b$li >= leftconst[i] & b$ri <= j])), 
                       max(c(-Inf, b$lower[b$li >= j            & b$ri <= rightconst[i + 1]])))
          upper <- max(min(c(Inf, b$upper[b$li >= leftconst[i] & b$ri <= j])), 
                       min(c(Inf, b$upper[b$li >= j            & b$ri <= rightconst[i + 1]])))
          expect_true((band$lower[j] == -Inf && lower == -Inf) || 
                        all.equal(lower, band$lower[j], tolerance = tolerance))
          expect_true((band$upper[j] ==  Inf && upper ==  Inf) || 
                        all.equal(upper, band$upper[j], tolerance = tolerance))
        }
      }
    }
  }
}


test_that("argument y is tested", {
  testn <- 100L
  testy <- rnorm(testn)
  testq <- rep(4, testn)
  
  expect_error(stepFit(q = testq))
  expect_error(stepFit(numeric(0), q = testq))
  expect_identical(stepFit(testy, q = testq),
                   stepFit(testy, x = 1:testn, x0 = 0, family = "gauss", intervalSystem = "all",
                           lengths = 1:testn, q = testq, confband = FALSE, jumpint = FALSE,
                           sd = sdrobnorm(testy)))
  expect_error(stepFit(as.integer(testy), q = testq))
  expect_error(stepFit(c(testy, "s"), q = testq))
  expect_error(stepFit(c(rnorm(10), NA), q = testq)) 
  
  s <- stepFit(testy, q = testq, sd = 1, confband = TRUE)
  bounds <- computeBounds(testy, q = testq, sd = 1)
  
  testx <- 1:testn
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9, sd = 1)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9, sd = 1)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
})

test_that("argument x works and is tested", {
  testy <- c(rnorm(40, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(40, 40))
  testn <- length(testy)
  testq <- rep(4, testn)
  
  expect_error(stepFit(y = testy, x = 1:10, q = testq))
  expect_error(stepFit(y = testy, x = c(1:214, "s"), q = testq))
  expect_error(stepFit(y = testy, x = 215:1, q = testq))
  expect_error(stepFit(y = testy, x = c(1:214, NA), q = testq))
  expect_error(stepFit(y = testy, x = c(1:214, Inf), q = testq))
  
  testx <- 1:testn
  expect_identical(stepFit(testy, x = testx, q = testq, sd = 1, confband = TRUE),
                   stepFit(testy, q = testq, sd = 1, confband = TRUE))
  
  testx <- 1:testn / 1e4
  s <- stepFit(testy, x = testx, q = testq, sd = 1, confband = TRUE)
  bounds <- computeBounds(testy, q = testq, sd = 1)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9, sd = 1)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9, sd = 1)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testx <- testn:1 / -4.5e2
  s <- stepFit(testy, x = testx, q = testq, sd = 1, confband = TRUE)
  bounds <- computeBounds(testy, q = testq, sd = 1)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9, sd = 1)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9, sd = 1)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testx <- c(0, 1.23, 3:95)
  s <- stepFit(testy, x = testx, q = testq, sd = 1, confband = TRUE)
  bounds <- computeBounds(testy, q = testq, sd = 1)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9, sd = 1)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9, sd = 1)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
})

test_that("argument x0 works and is tested", {
  testy <- c(rnorm(20, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(20, 40))
  testn <- length(testy)
  testq <- rep(5, testn)
  
  expect_error(stepFit(y = testy, x0 = 2, q = testq))
  expect_error(stepFit(y = testy, x0 = "0", q = testq))
  expect_error(stepFit(y = testy, x0 = Inf, q = testq))
  expect_error(stepFit(y = testy, x0 = c(0, 0.5), q = testq))
  
  expect_identical(stepFit(testy, x0 = 0, q = testq, sd = 1, confband = TRUE),
                   stepFit(testy, q = testq, sd = 1, confband = TRUE))
  
  testx <- 1:testn / 1e4
  s <- stepFit(testy, x = testx, x0 = -1, q = testq, sd = 1, confband = TRUE)
  bounds <- computeBounds(testy, q = testq, sd = 1)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9, sd = 1)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9, sd = 1)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
})

test_that("argument family is tested and works in the default case", { # other families below
  testn <- 53L
  testy <- c(rnorm(30, 1, 0.23), rnorm(testn - 30, -1, 0.34))
  testq <- 53:1 / 20
  
  expect_error(stepFit(testy, family = "", q = testq))
  expect_error(stepFit(testy, family = c("gauss", "hsmuce"), q = testq))
  expect_identical(stepFit(testy, q = testq), stepFit(testy, q = testq, family = "gauss"))
  
  testx <- 1:testn
  s <- stepFit(testy, q = testq, sd = 1, confband = TRUE)
  bounds <- computeBounds(testy, q = testq, sd = 1)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9, sd = 1)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9, sd = 1)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
})

test_that("argument intervalSystem is tested and works", {
  testn <- 23L
  testy <- c(rnorm(10, 1, 0.23), rnorm(testn - 10, -1, 0.34))
  testq <- 23:1 / 5
  
  expect_error(stepFit(testy, intervalSystem = "", q = testq))
  expect_error(stepFit(testy, intervalSystem = "dya", q = testq))
  expect_error(stepFit(testy, intervalSystem = "dyalen", q = testq))
  expect_error(stepFit(testy, intervalSystem = "dyapar", q = testq))
  expect_error(stepFit(testy, intervalSystem = c("all", "dyaLen"), q = testq))
  expect_identical(stepFit(testy, q = testq),
                   stepFit(testy, q = testq, intervalSystem = "all"))
  
  testq <- 5:1 / 5
  testx <- 1:testn
  s <- stepFit(testy, intervalSystem = "dyaLen", q = testq, sd = 1, confband = TRUE)
  bounds <- computeBounds(testy, intervalSystem = "dyaLen", q = testq, sd = 1)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9, sd = 1)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9, sd = 1)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testq <- 5:1 / 5
  testx <- 1:testn
  s <- stepFit(testy, intervalSystem = "dyaPar", q = testq, sd = 1, confband = TRUE)
  bounds <- computeBounds(testy, intervalSystem = "dyaPar", q = testq, sd = 1)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9, sd = 1)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9, sd = 1)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
})

test_that("argument lengths is tested and works", {
  testn <- 36L
  testy <- c(rnorm(12, 1, 0.23), rnorm(12, -1, 0.23), rnorm(12, 1, 0.23))
  testq <- 36:1 / 8
  
  expect_error(stepFit(testy, lengths = "s", q = testq))
  expect_error(stepFit(testy, lengths = c(1:10, NA), q = testq))
  expect_error(stepFit(testy, lengths = c(1:10, Inf), q = testq))
  expect_error(stepFit(testy, lengths = 0:10, q = testq))
  expect_error(stepFit(testy, lengths = -1L, q = testq))
  expect_error(stepFit(testy, lengths = 38L, q = testq))
  expect_warning(ret <- stepFit(testy, lengths = c(1:10, 10), q = testq))
  expect_identical(ret, stepFit(testy, lengths = c(1:10), q = testq))
  expect_identical(stepFit(testy, lengths = c(10:1), q = testq),
                   stepFit(testy, lengths = c(1:10), q = testq))
  expect_identical(stepFit(testy, lengths = c(1:10 + 0.5), q = testq),
                   stepFit(testy, lengths = c(1:10), q = testq))
  testq <- 2
  expect_error(stepFit(testy, intervalSystem = "dyaLen", lengths = 3L, q = testq))
  expect_error(stepFit(testy, intervalSystem = "dyaLen", lengths = 64L, q = testq))
  expect_error(stepFit(testy, intervalSystem = "dyaPar", lengths = 3L, q = testq))
  expect_error(stepFit(testy, intervalSystem = "dyaPar", lengths = 64L, q = testq))
  
  expect_equal(stepFit(testy, lengths = 2^(0:5), q = testq),
               stepFit(testy, intervalSystem = "dyaLen", q = testq))
  
  testq <- 9:1
  testlengths = c(2, 5:10, 35:36)
  testx <- 1:testn
  s <- stepFit(testy, lengths = testlengths, q = testq, sd = 1, confband = TRUE)
  bounds <- computeBounds(testy, lengths = testlengths, q = testq, sd = 1)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9, sd = 1)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9, sd = 1)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testq <- 3:1 / 5
  testlengths = c(2, 4, 32)
  testx <- 1:testn
  s <- stepFit(testy, lengths = testlengths, intervalSystem = "dyaLen", q = testq, sd = 1, confband = TRUE)
  bounds <- computeBounds(testy, intervalSystem = "dyaLen", lengths = testlengths, q = testq, sd = 1)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9, sd = 1)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9, sd = 1)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testq <- 2:1 / 5
  testlengths = c(1, 32)
  testx <- 1:testn
  s <- stepFit(testy, lengths = testlengths, intervalSystem = "dyaPar", q = testq, sd = 1, confband = TRUE)
  bounds <- computeBounds(testy, intervalSystem = "dyaPar", lengths = testlengths, q = testq, sd = 1)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9, sd = 1)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9, sd = 1)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
})

test_that("argument q is tested and works if it is given", {
  testn <- 36L
  testy <- c(rnorm(12, 1, 0.23), rnorm(12, -1, 0.23), rnorm(12, 1, 0.23))
  teststat <- monteCarloSimulation(36L)

  expect_warning(ret <- stepFit(testy))
  expect_identical(ret, stepFit(testy, alpha = 0.5))
  expect_warning(ret <- stepFit(testy, stat = teststat))
  expect_identical(ret, stepFit(testy, stat = teststat, alpha = 0.5))
  
  expect_error(stepFit(testy, q = "s", alpha = 0.1, stat = teststat))
  expect_error(stepFit(testy, q = c(rep(1, 35), "s"), alpha = 0.1, stat = teststat))
  expect_error(stepFit(testy, q = rep(1, 37), alpha = 0.1, stat = teststat))
  expect_error(stepFit(testy, q = rep(1, 33), alpha = 0.1, stat = teststat))
  
  testq <- 1:36
  attr(testq, "n") <- "s"
  expect_error(stepFit(testy, q = testq, alpha = 0.1, stat = teststat))
  
  attr(testq, "n") <- 35L
  expect_error(stepFit(testy, q = testq, alpha = 0.1, stat = teststat))
  
  expect_identical(stepFit(testy, q = 3, intervalSystem = "all", lengths = c(1:3, 8:23)),
                   stepFit(testy, intervalSystem = "all", lengths = c(1:3, 8:23),
                           q = critVal(q = 3, intervalSystem = "all", lengths = c(1:3, 8:23), n = testn)))
  expect_identical(stepFit(testy, q = 3, intervalSystem = "dyaLen", lengths = c(1, 4, 8, 32), nq = 45L),
                   stepFit(testy, intervalSystem = "dyaLen", lengths = c(1, 4, 8, 32),
                           q = critVal(q = 3, intervalSystem = "dyaLen", lengths = c(1, 4, 8, 32),
                   n = testn, nq = 45L)))
  expect_identical(stepFit(testy, q = 3, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32)),
                   stepFit(testy, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                           q = critVal(q = 3, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                                       n = testn)))
  
  testq <- 1:45
  attr(testq, "n") <- 45L
  expect_identical(stepFit(testy, q = testq), stepFit(testy, q = 1:36))
  expect_identical(stepFit(testy, q = 1:36, lengths = 3:23), stepFit(testy, q = 3:23, lengths = 3:23))
  expect_identical(stepFit(testy, q = testq, lengths = 3:23), stepFit(testy, q = 3:23, lengths = 3:23))
  expect_identical(stepFit(testy, q = 1:36, intervalSystem = "dyaLen"),
                   stepFit(testy, q = 2^(0:5), intervalSystem = "dyaLen"))
  expect_identical(stepFit(testy, q = testq, intervalSystem = "dyaLen"),
                   stepFit(testy, q = 2^(0:5), intervalSystem = "dyaLen"))
  testq <- 2^(0:6)
  attr(testq, "n") <- 64L
  expect_identical(stepFit(testy, q = testq, intervalSystem = "dyaPar"),
                   stepFit(testy, q = 2^(0:5), intervalSystem = "dyaPar"))
})
  
test_that("argument q is computed correctly", {
  testn <- 36L
  testy <- c(rnorm(12, 1, 0.23), rnorm(12, -1, 0.23), rnorm(12, 1, 0.23))
  teststat <- monteCarloSimulation(n = testn, r = 100L)
  
  ret <- stepFit(testy, alpha = 0.1, stat = teststat)
  expect_identical(ret, stepFit(testy, alpha = 0.1, stat = teststat, nq = testn, family = "gauss",
                                intervalSystem = "all", lengths = 1:testn, penalty = "sqrt"))
  expect_identical(ret, stepFit(testy, q = critVal(alpha = 0.1, stat = teststat, n = testn)))
  
  expect_error(stepFit(testy, alpha = "s", stat = teststat))
  expect_error(stepFit(testy, alpha = 0, stat = teststat))
  expect_identical(stepFit(testy, alpha = 0.075, stat = teststat),
                   stepFit(testy, q = critVal(alpha = 0.075, stat = teststat, n = testn)))
  
  expect_error(stepFit(testy, alpha = 0.1, stat = teststat, n = testn))
  
  expect_error(stepFit(testy, alpha = 0.1, nq = "s", stat = teststat))
  expect_error(stepFit(testy, q = 1, nq = "s", stat = teststat))
  expect_error(stepFit(testy, alpha = 0.1, nq = Inf, stat = teststat))
  expect_error(stepFit(testy, q = 1, nq = Inf, stat = teststat))
  expect_error(stepFit(testy, alpha = 0.1, nq = 8L, stat = teststat))
  expect_error(stepFit(testy, q = 1, nq = 8L, stat = teststat))
  
  expect_error(stepFit(testy, alpha = 0.1, penalty = "", stat = teststat))
  expect_error(stepFit(testy, alpha = 0.1, penalty = "ads", stat = teststat))
  
  expect_error(stepFit(testy, alpha = 0.1, penalty = "weights", weights = NA, stat = teststat))
  expect_error(stepFit(testy, alpha = 0.1, penalty = "weights", weights = rep(1 / 8, 8), stat = teststat))
  
  expect_identical(stepFit(testy, alpha = 0.1, penalty = "weights", stat = teststat),
                   stepFit(testy, q = critVal(alpha = 0.1, penalty = "weights", weights = rep(1 / 36, 36),
                                              stat = teststat, n = testn)))
  expect_identical(stepFit(testy, alpha = 0.1, penalty = "weights", weights = rep(1, 36),
                           stat = teststat),
                   stepFit(testy, q = critVal(alpha = 0.1, penalty = "weights",
                                              weights = rep(1 / 36, 36), stat = teststat, n = testn)))
  
  teststat <- monteCarloSimulation(n = 36L, r = 100L)
  expect_identical(stepFit(testy, alpha = 0.14, penalty = "log", stat = teststat,
                           intervalSystem = "all", lengths = c(1, 5, 8, 23)),
                   stepFit(testy, intervalSystem = "all", lengths = c(1, 5, 8, 23),
                           q = critVal(alpha = 0.14, intervalSystem = "all", lengths = c(1, 5, 8, 23),
                                       penalty = "log", stat = teststat, n = testn)))
  teststat <- monteCarloSimulation(n = 36L, r = 100L, intervalSystem = "dyaLen")
  expect_identical(stepFit(testy, alpha = 0.034, penalty = "none", stat = teststat,
                           intervalSystem = "dyaLen", lengths = c(1, 4, 8, 32)),
                   stepFit(testy, intervalSystem = "dyaLen", lengths = c(1, 4, 8, 32),
                           q = critVal(alpha = 0.034, intervalSystem = "dyaLen", lengths = c(1, 4, 8, 32),
                                       penalty = "none", stat = teststat, n = testn)))
  teststat <- monteCarloSimulation(n = 36L, r = 100L, intervalSystem = "dyaPar")
  expect_identical(stepFit(testy, alpha = 0.56, penalty = "weights", weights = c(0.2, 0.3, 0.4, 0.1),
                           stat = teststat, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32)),
                   stepFit(testy, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                           q = critVal(alpha = 0.56, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                                       penalty = "weights", weights = c(0.2, 0.3, 0.4, 0.1),
                                       stat = teststat, n = testn)))
  
  teststat <- matrix(abs(rnorm(1e4 * testn)), testn, 1e4)
  expect_error(stepFit(testy, alpha = 0.1, stat = teststat))

  teststat <- monteCarloSimulation(n = 37L, r = 100L)
  expect_identical(stepFit(testy, alpha = 0.05, stat = teststat, nq = 37L),
                   stepFit(testy, q = critVal(alpha = 0.05, stat = teststat, n = testn, nq = 37L)))
  
  teststat <- monteCarloSimulation(n = 36L, r = 100L, intervalSystem = "dyaPar")
  expect_identical(stepFit(testy, alpha = 0.014,
                           stat = teststat, nq = 100L, 
                           intervalSystem = "dyaPar", lengths = 2^c(0:3, 5)),
                   stepFit(testy, intervalSystem = "dyaPar", lengths = 2^c(0:3, 5),
                           q = critVal(alpha = 0.014, intervalSystem = "dyaPar", lengths = 2^c(0:3, 5),
                                       stat = teststat, n = testn, nq = 100L)))
  
  teststat <- monteCarloSimulation(n = 36L, r = 100L, intervalSystem = "all")
  expect_identical(stepFit(testy, alpha = 0.014, stat = teststat, nq = 100L, 
                           intervalSystem = "all", lengths = 1L),
                   stepFit(testy, intervalSystem = "all", lengths = 1L,
                           q = critVal(alpha = 0.014, intervalSystem = "all", lengths = 1,
                                       stat = teststat, n = testn, nq = 100L)))
  
  expect_error(stepFit(testy, alpha = 0.1, output = "vector", stat = teststat))
  expect_error(stepFit(testy, alpha = 0.1, data = 1, stat = teststat))
  
  teststat <- monteCarloSimulation(n = 36L, r = 100L, output = "maximum")
  expect_error(stepFit(testy, alpha = 0.1, penalty = "weights", stat = teststat))
  
  teststatmatrix <- monteCarloSimulation(n = 36L, r = 100L)
  teststatvector <- monteCarloSimulation(n = 36L, r = 100L, output = "maximum", penalty = "sqrt")
  expect_identical(stepFit(testy, alpha = 0.05, stat = teststatvector),
                   stepFit(testy, q = critVal(alpha = 0.05, stat = teststatmatrix, n = testn)))
  
  teststatvector <- monteCarloSimulation(n = 36L, r = 100L, output = "maximum",
                                         penalty = "log", lengths = c(1, 3, 5, 8, 9, 12))
  expect_identical(stepFit(testy, alpha = 0.15, stat = teststatvector, nq = 100L,
                           lengths = c(1, 3, 5, 8, 9, 12), penalty = "log"),
                   stepFit(testy, lengths = c(1, 3, 5, 8, 9, 12),
                           q = critVal(alpha = 0.15, stat = teststatmatrix, n = testn, nq = 100L,
                                       lengths = c(1, 3, 5, 8, 9, 12), penalty = "log")))
  
  teststatmatrix <- monteCarloSimulation(n = 36L, r = 100L, intervalSystem = "dyaLen")
  teststatvector <- monteCarloSimulation(n = 36L, r = 100L, output = "maximum", intervalSystem = "dyaLen",
                                         penalty = "sqrt", lengths = c(1, 2, 8, 16))
  expect_identical(stepFit(testy, alpha = 0.05, stat = teststatvector, nq = 2^7L,
                           intervalSystem = "dyaLen", lengths = c(1, 2, 8, 16), penalty = "sqrt"),
                   stepFit(testy, intervalSystem = "dyaLen", lengths = c(1, 2, 8, 16),
                           q = critVal(alpha = 0.05, stat = teststatmatrix, n = testn, nq = 2^7L,
                                       intervalSystem = "dyaLen", lengths = c(1, 2, 8, 16), penalty = "sqrt")))
  

  teststatmatrix <- monteCarloSimulation(n = 36L, r = 100L, intervalSystem = "dyaPar")
  teststatvector <- monteCarloSimulation(n = 36L, r = 100L, output = "maximum", intervalSystem = "dyaPar",
                                         penalty = "sqrt", lengths = c(1, 2, 8, 16, 32))
  expect_identical(stepFit(testy, alpha = 0.122, stat = teststatvector, nq = 2^9L,
                           intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32), penalty = "sqrt"),
                   stepFit(testy, intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32),
                           q = critVal(alpha = 0.122, stat = teststatmatrix, n = testn, nq = 2^9L,
                                       intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32),
                                       penalty = "sqrt")))
  expect_identical(stepFit(testy, alpha = 0.122, stat = teststatvector, nq = 2^9L,
                           intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32), penalty = "sqrt"),
                   stepFit(testy, intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32),
                           q = critVal(alpha = 0.122, stat = teststatvector, n = testn, nq = 2^9L,
                                       intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32),
                                       penalty = "sqrt", output = "vector")))
  expect_identical(stepFit(testy, alpha = 0.122, stat = teststatvector, nq = 2^9L,
                           intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32), penalty = "sqrt"),
                   stepFit(testy, intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32),
                           q = critVal(alpha = 0.122, stat = teststatmatrix, n = testn, nq = 2^9L,
                                       intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32),
                                       penalty = "sqrt", output = "vector")))
  
  expect_error(stepFit(testy, alpha = 0.1, r = "s", options = list(load = list())))
  expect_error(stepFit(testy, alpha = 0.1, r = 0, options = list(load = list())))
  expect_error(stepFit(testy, alpha = 0.1, r = c(100, 200), options = list(load = list())))
  
  expect_identical(stepFit(testy, alpha = 0.1, r = 100.5, options = list(load = list())),
                   stepFit(testy, alpha = 0.1, r = 100L, options = list(load = list())))
  
  expect_error(stepFit(testy, alpha = 0.1, r = 100L,
                       options = list(simulat = "vector", save = list(), load = list())))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L, options = "vector"))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vecto", save = list(), load = list())))
  
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, intervalSystem = "dyaPar",
                           lengths = c(2, 4, 8), penalty = "log",
                           options = list(simulation = "vector", save = list(), load = list())),
                   stepFit(testy, intervalSystem = "dyaPar", lengths = c(2, 4, 8),
                           q = critVal(n = length(testy), alpha = 0.1, r = 100L, intervalSystem = "dyaPar",
                                       lengths = c(2, 4, 8), penalty = "log",
                                       options = list(simulation = "vector", save = list(), load = list()))))
  
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, lengths = 3:17, penalty = "log",
                           options = list(simulation = "vectorIncreased", save = list(), load = list())),
                   stepFit(testy, lengths = 3:17,
                           q = critVal(n = length(testy), alpha = 0.1, r = 100L, lengths = 3:17, 
                                       penalty = "log",
                                       options = list(simulation = "vectorIncreased", save = list(),
                                                      load = list()))))
  
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, lengths = 3:17, penalty = "log", nq = 100,
                           options = list(simulation = "vectorIncreased", save = list(), load = list())),
                   stepFit(testy, lengths = 3:17,
                           q = critVal(n = 100, alpha = 0.1, r = 100L, lengths = 3:17, 
                                       penalty = "log",
                                       options = list(simulation = "vector", save = list(),
                                                      load = list()))))
  
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, lengths = 10:13, penalty = "weights",
                           weights = rep(1 / 4, 4),
                           options = list(simulation = "matrix", save = list(), load = list())),
                   stepFit(testy, lengths = 10:13,
                           q = critVal(n = length(testy), alpha = 0.1, r = 100L, lengths = 10:13,
                                       penalty = "weights", weights = rep(1 / 4, 4),
                                       options = list(simulation = "matrix", save = list(),
                                                      load = list()))))
  
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L,
                           options = list(simulation = "matrixIncreased", save = list(), load = list())),
                   stepFit(testy, q = critVal(n = length(testy), alpha = 0.1, r = 100L,
                                              options = list(simulation = "matrixIncreased", save = list(),
                                                             load = list()))))
  
  testfile <- c(tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".RDS"),
                tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".RDS"))
  
  expect_error(stepFit(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(RDSfile = testfile, test = 1),
                                      load = list())))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(RDSfile = testfile),
                                      load = list(test = "test"))))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(RDSfile = c(testfile, testfile)),
                                      load = list())))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(RDSfile = 10),
                                      load = list())))
  
  teststat <- monteCarloSimulation(36L, r = 100L)
  teststatvec <- monteCarloSimulation(36L, r = 100L, output = "maximum")
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L,
                           options = list(simulation = "matrix", save = list(RDSfile = testfile), load = list())),
                   stepFit(testy, alpha = 0.1, stat = teststat))
  expect_identical(readRDS(testfile[1]), teststatvec)
  expect_identical(readRDS(testfile[2]), teststat)
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", load = list(RDSfile = 10),
                                      save = list())))
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", load = list(RDSfile = testfile),
                                      save = list())))
  expect_identical(stepFit(testy, alpha = 0.1, r = 50L,
                           options = list(simulation = "matrix", load = list(RDSfile = testfile[1]),
                                          save = list())),
                   stepFit(testy, alpha = 0.1, stat = teststat))
  expect_identical(stepFit(testy, alpha = 0.1, r = 50L,
                           options = list(simulation = "matrix", load = list(RDSfile = testfile[1]),
                                          save = list())),
                   stepFit(testy, alpha = 0.1, stat = teststat))
  unlink(testfile)
  
  testvariable <- c("testsavevector", "testsavematrix")
  testStepR <- new.env()
  
  expect_error(stepFit(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(variable = c(testvariable, testvariable)),
                                      load = list(), envir = testStepR)))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(variable = 10),
                                      load = list(), envir = testStepR)))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(variable = testvariable),
                                      load = list(), envir = "testStepR")))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(variable = testvariable),
                                      load = list(), envir = c(testStepR, testStepR))))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(variable = testvariable),
                                      load = list(), envir = c(testStepR, 10))))
  
  teststat <- monteCarloSimulation(36L, r = 100L, output = "maximum")
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L,
                           options = list(simulation = "vector", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   stepFit(testy, alpha = 0.1, stat = teststat))
  expect_identical(get("testsavevector", envir = testStepR), teststat)
  expect_false(exists("testsavematrix", envir = testStepR))
  remove(testsavevector, envir = testStepR)
  
  expect_error(stepFit(testy, alpha = 0.1, r = 100L, 
                       options = list(simulation = "matrix", save = list(workspace = "matri"),
                                      load = list(), envir = testStepR)))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L, 
                       options = list(simulation = "matrix", save = list(workspace = c("vector", "matri")),
                                      load = list(), envir = testStepR)))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "matrix", load = list(workspace = "matri"),
                                      save = list(), envir = testStepR)))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "matrix", load = list(workspace = c("vector", "matri")),
                                      save = list(), envir = testStepR)))
  
  teststat <- monteCarloSimulation(36L, r = 100L)
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L,
                           options = list(simulation = "matrix", save = list(workspace = "matrix"),
                                          load = list(), envir = testStepR)),
                   stepFit(testy, alpha = 0.1, stat = teststat, options = list()))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  expect_identical(stepFit(testy, alpha = 0.1, r = 50L,
                           options = list(simulation = "matrix", save = list(),
                                          load = list(workspace = "matrix"), envir = testStepR)),
                   stepFit(testy, alpha = 0.1, stat = teststat, options = list()))
  remove(critValStepRTab, envir = testStepR)
  
  
  expect_error(stepFit(testy, alpha = 0.1, r = 100L, 
                       options = list(simulation = "matrix", save = list(fileSystem = "matri"),
                                      load = list(), dirs = "testStepR")))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L, 
                       options = list(simulation = "matrix", save = list(fileSystem = c("vector", "matri")),
                                      load = list(), dirs = "testStepR")))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L, 
                       options = list(simulation = "matrix", load = list(fileSystem = "matri"),
                                      save = list(), dirs = "testStepR")))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L, 
                       options = list(simulation = "matrix", load = list(fileSystem = c("vector", "matri")),
                                      save = list(), dirs = "testStepR")))
  
  expect_error(stepFit(testy, alpha = 0.1, r = 100L, 
                       options = list(simulation = "matrix", save = list(fileSystem = "matrix"),
                                      load = list(), dirs = c("testStepR", "test"))))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "matrix", save = list(fileSystem = "matrix"),
                                      load = list(), dirs = 10)))
  
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, 
                           options = list(simulation = "matrix", save = list(fileSystem = "matrix"),
                                          load = list(), dirs = "testStepR")),
                   stepFit(testy, alpha = 0.1, stat = teststat, options = list()))
  expect_identical(R.cache::loadCache(attr(teststat, "keyList"), dirs = "testStepR"), teststat)
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 1L)
  expect_identical(critVal(36L, alpha = 0.1, r = 50L,
                           options = list(simulation = "matrix", save = list(),
                                          load = list(fileSystem = "matrix"), dirs = "testStepR")),
                   critVal(36L, alpha = 0.1, stat = teststat, options = list()))
  expect_identical(stepFit(testy, alpha = 0.1, r = 50L,
                           options = list(simulation = "matrix", save = list(),
                                          load = list(fileSystem = "matrix"), dirs = "testStepR")),
                   stepFit(testy, alpha = 0.1, stat = teststat, options = list()))
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
  
  teststat1 <- monteCarloSimulation(36L, r = 100L, output = "maximum", lengths = c(23:34))
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L,lengths = c(23:34),
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrixIncreased", "vector", "matrix"),
                                                      fileSystem = c("matrixIncreased", "vector", "matrix"),
                                                      RDSfile = testfile, variable = testvariable),
                                          load = list(), envir = testStepR, dirs = "testStepR")),
                   stepFit(testy, alpha = 0.1, stat = teststat1, lengths = c(23:34),
                           options = list()))
  expect_identical(readRDS(testfile[1]), teststat1)
  expect_false(file.exists(testfile[2]))
  expect_identical(get("testsavevector", envir = testStepR), teststat1)
  expect_false(exists("testsavematrix", envir = testStepR))
  
  teststat2 <- monteCarloSimulation(36L, r = 100L, intervalSystem = "dyaPar")
  teststat3 <- monteCarloSimulation(36L, r = 100L, output = "maximum", intervalSystem = "dyaPar",
                                    lengths = 2^(1:3))
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, intervalSystem = "dyaPar", lengths = 2^(1:3),
                           options = list(simulation = "matrix",
                                          save = list(workspace = c("vectorIncreased", "vector"),
                                                      fileSystem = c("matrixIncreased", "matrix"),
                                                      RDSfile = testfile, variable = testvariable),
                                          load = list(), envir = testStepR, dirs = "testStepR")),
                   stepFit(testy, alpha = 0.1, stat = teststat2, intervalSystem = "dyaPar",
                           lengths = 2^(1:3), options = list()))
  expect_identical(readRDS(testfile[1]), teststat3)
  expect_identical(readRDS(testfile[2]), teststat2)
  expect_identical(get("testsavevector", envir = testStepR), teststat3)
  expect_identical(get("testsavematrix", envir = testStepR), teststat2)
  unlink(testfile)
  remove(testsavevector, envir = testStepR)
  remove(testsavematrix, envir = testStepR)
  
  teststat <- monteCarloSimulation(63L, r = 100L)
  teststat4 <- monteCarloSimulation(63L, r = 100L, output = "maximum", lengths = 1:36, penalty = "log")
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, stat = teststat, penalty = "log",
                           options = list(simulation = "matrixIncreased",
                                          save = list(workspace = c("matrix", "vectorIncreased"),
                                                      fileSystem = c("vector", "matrix")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   stepFit(testy, alpha = 0.1, stat = teststat, penalty = "log", options = list()))
  
  teststat1new <- monteCarloSimulation(36L, r = 200L, output = "maximum", lengths = c(23:34))
  expect_identical(critVal(36L, alpha = 0.1, r = 200L, output = "value", lengths = c(23:34),
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrixIncreased", "vector", "matrix")),
                                          load = list(workspace = c("vector", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   critVal(36L, alpha = 0.1, stat = teststat1new, output = "value", lengths = c(23:34),
                           options = list()))
  
  expect_identical(stepFit(testy, alpha = 0.1, r = 50L, penalty = "log",
                           options = list(simulation = "matrix",
                                          save = list(fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   stepFit(testy, alpha = 0.1, stat = teststat4, penalty = "log", options = list()))
  
  teststat5 <- monteCarloSimulation(36L, r = 100L, output = "maximum", intervalSystem = "dyaLen",
                                    lengths = 16L, penalty = "log")
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, intervalSystem = "dyaLen",
                           lengths = 16L, penalty = "log", stat = teststat5,
                           options = list(simulation = "vector",
                                          save = list(fileSystem = c("matrix", "vector"),
                                                      workspace = c("matrix", "matrixIncreased")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   stepFit(testy, alpha = 0.1, stat = teststat5, intervalSystem = "dyaLen",
                           lengths = 16L, penalty = "log", options = list()))
  
  teststat6 <- monteCarloSimulation(125L, r = 100L, intervalSystem = "dyaLen")
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, penalty = "weights", nq = 125L,
                           weights = 1:6 / sum(1:6), intervalSystem = "dyaLen",
                           options = list(simulation = "matrixIncreased",
                                          save = list(workspace = c("matrixIncreased", "vector"),
                                                      fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   stepFit(testy, alpha = 0.1, stat = teststat6, penalty = "weights",
                           weights = 1:6 / sum(1:6), intervalSystem = "dyaLen", options = list()))
  
  teststat6b <- monteCarloSimulation(125L, r = 100L, output = "maximum", penalty = "log",
                                     intervalSystem = "dyaLen", lengths = 2^(2:4))
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, penalty = "log",
                           intervalSystem = "dyaLen", lengths = 2^(2:4), nq = 125L,
                           options = list(simulation = "matrix",
                                          save = list(workspace = c("matrixIncreased", "vector"),
                                                      fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(workspace = c("matrixIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   stepFit(testy, alpha = 0.1, stat = teststat6, penalty = "log",
                           intervalSystem = "dyaLen", lengths = 2^(2:4), options = list()))
  
  teststat <- monteCarloSimulation(36L, r = 200L, output = "maximum", rand.gen = function(data) {rnorm(36)})
  expect_identical(stepFit(testy, alpha = 0.1, r = 200L, rand.gen = function(data) {rnorm(36)},
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrix", "vectorIncreased",
                                                                    "vector")),
                                          load = list(fileSystem = c("vectorIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   stepFit(testy, alpha = 0.1, stat = teststat, options = list()))
  
  teststat7 <- monteCarloSimulation(125L, r = 100L, output = "maximum", intervalSystem = "dyaLen",
                                    lengths = 2^(3:5), penalty = "log")
  expect_identical(critVal(120L, alpha = 0.1, r = 100L, output = "value", intervalSystem = "dyaLen",
                           lengths = 2^(3:5), penalty = "log", nq = 125L,
                           options = list(simulation = "vectorIncreased",
                                          save = list(workspace = c("matrixIncreased", "vectorIncreased")),
                                          load = list(workspace = c("matrix", "vector"),
                                                      fileSystem = c("vectorIncreased", "matrixIncreased")),
                                          envir = testStepR, dirs = "testStepR")),
                   critVal(120L, alpha = 0.1, stat = teststat7, output = "value", options = list(),
                           intervalSystem = "dyaLen", lengths = 2^(3:5), penalty = "log"))
  
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 5L)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat1new)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[2]], teststat3)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[3]], teststat4)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[4]], teststat6)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[5]], teststat7)
  remove(critValStepRTab, envir = testStepR)
  
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 5L)
  expect_identical(R.cache::loadCache(attr(teststat1, "keyList"), dirs = "testStepR"), teststat1)
  expect_identical(R.cache::loadCache(attr(teststat2, "keyList"), dirs = "testStepR"), teststat2)
  expect_identical(R.cache::loadCache(attr(teststat4, "keyList"), dirs = "testStepR"), teststat4)
  expect_identical(R.cache::loadCache(attr(teststat5, "keyList"), dirs = "testStepR"), teststat5)
  expect_identical(R.cache::loadCache(attr(teststat6b, "keyList"), dirs = "testStepR"), teststat6b)
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
  
  if ("stepRdata" %in% rownames(installed.packages())) {
    teststat <- monteCarloSimulation(63L, intervalSystem = "dyaLen")
    expect_equal(stepFit(testy, alpha = 0.1, r = 100L, intervalSystem = "dyaLen",
                             options = list(simulation = "vector", save = list(),
                                            load = list(package = TRUE),
                                            envir = testStepR, dirs = "testStepR")),
                     stepFit(testy, alpha = 0.1, stat = teststat, intervalSystem = "dyaLen",
                             options = list()))
  }
  
  expect_error(stepFit(testy, alpha = 0.1, test = 1, options = list(load = list())))
  
  expect_error(stepFit(testy, alpha = 0.1, sd = "s", options = list(load = list())))
  expect_error(stepFit(testy, alpha = 0.1, sd = 0, options = list(load = list())))
  expect_error(stepFit(testy, alpha = 0.1, sd = c(1, 2), options = list(load = list())))
  
  expect_error(supressWarning(stepFit(testy, alpha = 0.1, r = 100L, seed = "s", options = list(load = list()))))
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, seed = c(1, 2), options = list(load = list())),
                   stepFit(testy, alpha = 0.1, r = 100L, seed = 1L, options = list(load = list())))
  
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, seed = 100.5, options = list(load = list())),
                   stepFit(testy, alpha = 0.1, r = 100L, seed = 100L, options = list(load = list())))
  
  teststat <- monteCarloSimulation(n = 63L, r = 100L)
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, seed = 63L, options = list(load = list())),
                   stepFit(testy, alpha = 0.1, r = 100L, stat = teststat))
  
  teststat <- monteCarloSimulation(n = 36L, r = 100L)
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, seed = 36L,
                                 options = list(load = list(), simulation = "matrix")),
                   stepFit(testy, alpha = 0.1, r = 100L, stat = teststat))
  
  expect_error(stepFit(testy, alpha = 0.1, r = 100L, rand.gen = 10, options = list(load = list())))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L, rand.gen = function(data, n) {rnorm(10)},
                       options = list(load = list())))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L, rand.gen = function(data) {rnorm(10)},
                       options = list(load = list())))
  
  teststat <- monteCarloSimulation(n = 63L, r = 100L)
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, rand.gen = function(data) {rnorm(63)},
                           options = list(load = list())),
                   stepFit(testy, alpha = 0.1, r = 100L, stat = teststat))
  
  expect_error(stepFit(testy, alpha = 0.1, r = 100L, messages = "s", options = list(load = list())))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L, messages = c(10, 20), options = list(load = list())))
  expect_error(stepFit(testy, alpha = 0.1, r = 100L, messages = 0, options = list(load = list())))
  
  expect_identical(suppressMessages(stepFit(testy, alpha = 0.1, r = 100L, messages = 10.5,
                                            options = list(load = list()))),
                   suppressMessages(stepFit(testy, alpha = 0.1, r = 100L, messages = 10L,
                                            options = list(load = list()))))
})

test_that("arguments confband and jumpint work and are tested", {
  testn <- 40L
  testy <- c(rnorm(10L), rnorm(10L, 5), rnorm(10L, 10), rnorm(10L, 15))
  testq <- rep(4, testn)
  
  expect_error(stepFit(y = testy, q = testq, confband = 1))
  expect_error(stepFit(y = testy, q = testq, confband = c(FALSE, FALSE)))
  expect_error(stepFit(y = testy, q = testq, confband = as.logical(NA)))
  expect_error(stepFit(y = testy, q = testq, jumpint = "s"))
  expect_error(stepFit(y = testy, q = testq, jumpint = c(TRUE, TRUE)))
  expect_error(stepFit(y = testy, q = testq, jumpint = as.logical(NA)))
  
  expect_identical(stepFit(y = testy, q = testq),
                   stepFit(y = testy, q = testq, confband = FALSE, jumpint = FALSE))
  expect_identical(stepFit(y = testy, q = testq, confband = FALSE),
                   stepFit(y = testy, q = testq, confband = FALSE, jumpint = FALSE))
  expect_identical(stepFit(y = testy, q = testq, jumpint = FALSE),
                   stepFit(y = testy, q = testq, confband = FALSE, jumpint = FALSE))
  expect_identical(stepFit(y = testy, q = testq, confband = TRUE),
                   stepFit(y = testy, q = testq, confband = TRUE, jumpint = TRUE))
  expect_identical(stepFit(y = testy, q = testq, confband = TRUE, jumpint = FALSE),
                   stepFit(y = testy, q = testq, confband = TRUE, jumpint = TRUE))
  
  s <- stepFit(testy, q = testq, sd = 1, confband = TRUE)
  bounds <- computeBounds(testy, q = testq, sd = 1)
  
  testx <- 1:testn
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9, sd = 1)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9, sd = 1)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  s2 <- stepFit(testy, q = testq, sd = 1, confband = FALSE, jumpint = TRUE)
  s3 <- stepFit(testy, q = testq, sd = 1, confband = FALSE, jumpint = FALSE)
  
  attr(s2, "confband") <- attr(s, "confband")
  expect_equal(s2, s, tolerance = 1e-12)
  
  s3$leftEndLeftBound <- s$leftEndLeftBound
  s3$leftEndRightBound <- s$leftEndRightBound
  s3$rightEndLeftBound <- s$rightEndLeftBound
  s3$rightEndRightBound <- s$rightEndRightBound
  s3$leftIndexLeftBound <- s$leftIndexLeftBound
  s3$leftIndexRightBound <- s$leftIndexRightBound
  s3$rightIndexLeftBound <- s$rightIndexLeftBound
  s3$rightIndexRightBound <- s$rightIndexRightBound
  attr(s3, "confband") <- attr(s, "confband")
  expect_equal(s3, s, tolerance = 1e-12)
  
  
  testn <- 16L
  testy <- rnorm(testn)
  testq <- rep(5, testn)
  
  s <- stepFit(testy, q = testq, sd = 1, confband = TRUE)
  bounds <- computeBounds(testy, q = testq, sd = 1)
  
  testx <- 1:testn
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9, sd = 1)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9, sd = 1)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  s2 <- stepFit(testy, q = testq, sd = 1, confband = FALSE, jumpint = TRUE)
  s3 <- stepFit(testy, q = testq, sd = 1, confband = FALSE, jumpint = FALSE)
  
  attr(s2, "confband") <- attr(s, "confband")
  expect_equal(s2, s, tolerance = 1e-12)
  
  s3$leftEndLeftBound <- s$leftEndLeftBound
  s3$leftEndRightBound <- s$leftEndRightBound
  s3$rightEndLeftBound <- s$rightEndLeftBound
  s3$rightEndRightBound <- s$rightEndRightBound
  s3$leftIndexLeftBound <- s$leftIndexLeftBound
  s3$leftIndexRightBound <- s$leftIndexRightBound
  s3$rightIndexLeftBound <- s$rightIndexLeftBound
  s3$rightIndexRightBound <- s$rightIndexRightBound
  attr(s3, "confband") <- attr(s, "confband")
  expect_equal(s3, s, tolerance = 1e-12)
  
  
  testn <- 16L
  testy <- c(rnorm(testn / 2), rnorm(testn / 2, 20))
  testq <- rep(5, testn)
  
  s <- stepFit(testy, q = testq, sd = 1, confband = TRUE)
  bounds <- computeBounds(testy, q = testq, sd = 1)
  
  testx <- 1:testn
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9, sd = 1)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9, sd = 1)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  s2 <- stepFit(testy, q = testq, sd = 1, confband = FALSE, jumpint = TRUE)
  s3 <- stepFit(testy, q = testq, sd = 1, confband = FALSE, jumpint = FALSE)
  
  attr(s2, "confband") <- attr(s, "confband")
  expect_equal(s2, s, tolerance = 1e-12)
  
  s3$leftEndLeftBound <- s$leftEndLeftBound
  s3$leftEndRightBound <- s$leftEndRightBound
  s3$rightEndLeftBound <- s$rightEndLeftBound
  s3$rightEndRightBound <- s$rightEndRightBound
  s3$leftIndexLeftBound <- s$leftIndexLeftBound
  s3$leftIndexRightBound <- s$leftIndexRightBound
  s3$rightIndexLeftBound <- s$rightIndexLeftBound
  s3$rightIndexRightBound <- s$rightIndexRightBound
  attr(s3, "confband") <- attr(s, "confband")
  expect_equal(s3, s, tolerance = 1e-12)
})

test_that("... is tested and works", {
  testn <- 22L
  testy <- rnorm(testn)
  testq <- rep(1, testn)
  
  expect_error(stepFit(testy, q = testq, std = 1))
  expect_error(stepFit(testy, sd = "s", q = testq))
  expect_error(stepFit(testy, sd = c(1, 2), q = testq))
  expect_error(stepFit(testy, sd = NA, q = testq))
  expect_error(stepFit(c(1, 2), q = c(2, 2)))
  expect_error(stepFit(testy, sd = Inf, q = testq))
  expect_error(stepFit(testy, sd = 0, q = testq))
  expect_error(stepFit(testy, sd = -0.1, q = testq))
  expect_identical(stepFit(testy, q = testq), stepFit(testy, q = testq, sd = sdrobnorm(testy)))
  expect_identical(stepFit(testy, q = testq, sd = 1L), stepFit(testy, q = testq, sd = 1))
})

test_that("family 'hsmuce' works", {
  testn <- 40L
  testy <- rnorm(testn)
  testq <- rep(4, 5)
  
  expect_error(stepFit(family = "hsmuce", q = testq))
  expect_identical(stepFit(testy, family = "hsmuce", q = testq),
                   stepFit(testy, x = 1:testn, x0 = 0, family = "hsmuce", intervalSystem = "dyaPar",
                           lengths = 2^(1:5), q = testq, confband = FALSE, jumpint = FALSE))
  expect_error(stepFit(as.integer(testy), family = "hsmuce", q = testq))
  expect_error(stepFit(c(testy, "s"), family = "hsmuce", q = testq))
  expect_error(stepFit(c(rnorm(10), NA), family = "hsmuce", q = testq)) 
  
  s <- stepFit(testy, q = testq, family = "hsmuce", confband = TRUE)
  bounds <- computeBounds(testy, q = testq, family = "hsmuce")
  
  testx <- 1:testn
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostHsmuce, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostHsmuce, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testy <- c(rnorm(40, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(40, 40))
  testn <- length(testy)
  testq <- c(1e4, 1e2, rep(3, 4))
  testx <- 1:testn / 1e4
  s <- stepFit(testy, x = testx, q = testq, family = "hsmuce", confband = TRUE)
  bounds <- computeBounds(testy, q = testq, family = "hsmuce")
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostHsmuce, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostHsmuce, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testy <- c(rnorm(20, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(20, 40))
  testn <- length(testy)
  testq <- c(1e4, 1e2, rep(3, 3))
  
  testx <- 1:testn / 5.34
  s <- stepFit(testy, x = testx, x0 = -1, q = testq, family = "hsmuce", confband = TRUE)
  bounds <- computeBounds(testy, q = testq, family = "hsmuce")
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostHsmuce, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostHsmuce, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testn <- 23L
  testy <- c(rnorm(10, 1, 0.23), rnorm(testn - 10, -1, 0.34))
  testq <- c(1e5, 1e4, 1e3, 1e2, 1e1, rep(5, 18))
  
  expect_identical(stepFit(testy, family = "hsmuce", q = testq),
                   stepFit(testy, family = "hsmuce", q = testq, intervalSystem = "dyaPar"))
  
  testx <- 1:testn
  s <- stepFit(testy, q = testq, family = "hsmuce", intervalSystem = "all", confband = TRUE)
  bounds <- computeBounds(testy, q = testq, family = "hsmuce", intervalSystem = "all")
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostHsmuce, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostHsmuce, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testx <- 1:testn
  s <- stepFit(testy, q = testq, family = "hsmuce", intervalSystem = "dyaLen", confband = TRUE)
  bounds <- computeBounds(testy, q = testq, family = "hsmuce", intervalSystem = "dyaLen")
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostHsmuce, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostHsmuce, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testn <- 36L
  testy <- c(rnorm(12, 1, 0.13), rnorm(12, -1, 0.23), rnorm(12, 1, 0.43))
  
  testq <- 2
  expect_error(stepFit(testy, family = "hsmuce", lengths = 1L, q = testq))
  expect_error(stepFit(testy, family = "hsmuce", lengths = 64L, q = testq))
  expect_error(stepFit(testy, family = "hsmuce", intervalSystem = "dyaLen", lengths = 1L, q = testq))
  expect_error(stepFit(testy, family = "hsmuce", intervalSystem = "dyaLen", lengths = 64L, q = testq))
  expect_error(stepFit(testy, family = "hsmuce", intervalSystem = "all", lengths = 1L, q = testq))
  expect_error(stepFit(testy, family = "hsmuce", intervalSystem = "all", lengths = 64L, q = testq))
  
  testq <- c(1e5, 1e4, 1e3, 1e2, 1e1, rep(4, 31))
  expect_equal(stepFit(testy, family = "hsmuce", intervalSystem = "all", lengths = 2^(1:5), q = testq),
               stepFit(testy, family = "hsmuce", intervalSystem = "dyaLen", q = testq))
  expect_error(stepFit(testy, family = "hsmuce", q = testq, sd = 1))
  
  testq <- c(1e5, 8:1)
  testlengths = c(2, 5:10, 35:36)
  testx <- 1:testn
  s <- stepFit(testy, q = testq, family = "hsmuce", intervalSystem = "all", lengths = testlengths,
               confband = TRUE)
  bounds <- computeBounds(testy, q = testq, family = "hsmuce", intervalSystem = "all", lengths = testlengths)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostHsmuce, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostHsmuce, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testq <- c(1e5, 1e2, 5)
  testlengths = c(2, 4, 16)
  testx <- 1:testn
  s <- stepFit(testy, q = testq, family = "hsmuce", intervalSystem = "dyaLen", lengths = testlengths,
               confband = TRUE)
  bounds <- computeBounds(testy, q = testq, family = "hsmuce", intervalSystem = "dyaLen",
                          lengths = testlengths)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostHsmuce, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostHsmuce, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testq <- c(1e5, 4)
  testlengths = c(2, 8)
  testx <- 1:testn
  s <- stepFit(testy, q = testq, family = "hsmuce", lengths = testlengths,
               confband = TRUE)
  bounds <- computeBounds(testy, q = testq, family = "hsmuce", lengths = testlengths)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostHsmuce, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostHsmuce, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
})

test_that("argument q is tested and works for family 'hsmuce'", {
  testn <- 36L
  testy <- c(rnorm(12, 1, 0.13), rnorm(12, -1, 0.23), rnorm(12, 1, 0.43))
  teststat <- monteCarloSimulation(n = 36L, r = 100L, family = "hsmuce")
  
  expect_warning(ret <- stepFit(testy, family = "hsmuce"))
  expect_identical(ret, stepFit(testy, family = "hsmuce", alpha = 0.5))
  expect_error(stepFit(testy, q = Inf, alpha = 0.1, stat = teststat, family = "hsmuce"))
  expect_error(stepFit(testy, q = rep(1, 6), alpha = 0.1, stat = teststat, family = "hsmuce"))
  expect_error(stepFit(testy, q = rep(1, 4), alpha = 0.1, stat = teststat, family = "hsmuce"))
  
  testq <- 1:5
  attr(testq, "n") <- "s"
  expect_error(stepFit(testy, q = testq, alpha = 0.1, stat = teststat, family = "hsmuce"))
  
  attr(testq, "n") <- 35L
  expect_error(stepFit(testy, q = testq, alpha = 0.1, stat = teststat, family = "hsmuce"))
  
  expect_identical(stepFit(testy, q = 3, family = "hsmuce", intervalSystem = "all", lengths = c(2:3, 8:23),
                           penalty = "sqrt"),
                   stepFit(testy, family = "hsmuce", intervalSystem = "all", lengths = c(2:3, 8:23),
                           q = critVal(q = 3, family = "hsmuce", intervalSystem = "all",
                                       lengths = c(2:3, 8:23), n = testn, penalty = "sqrt")))
  expect_identical(stepFit(testy, q = 3, intervalSystem = "dyaLen", lengths = c(2, 4, 8, 32), nq = 45L, 
                           penalty = "none"),
                   stepFit(testy, intervalSystem = "dyaLen", lengths = c(2, 4, 8, 32),
                           q = critVal(q = 3, intervalSystem = "dyaLen", lengths = c(2, 4, 8, 32),
                                       n = testn, nq = 45L, penalty = "none")))
  expect_identical(stepFit(testy, q = 3, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                           penalty = "log"),
                   stepFit(testy, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                           q = critVal(q = 3, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                                       n = testn, penalty = "log")))
  testq <- 1:45
  attr(testq, "n") <- 45L
  expect_identical(stepFit(testy, family = "hsmuce", intervalSystem = "all", q = testq),
                   stepFit(testy, family = "hsmuce", intervalSystem = "all", q = 2:36))
  testq <- 2:45
  attr(testq, "n") <- 45L
  expect_identical(stepFit(testy, family = "hsmuce", intervalSystem = "all", q = testq),
                   stepFit(testy, family = "hsmuce", intervalSystem = "all", q = 2:36))
  testq <- 1:36
  attr(testq, "n") <- 45L
  expect_identical(stepFit(testy, family = "hsmuce", intervalSystem = "all", q = testq),
                   stepFit(testy, family = "hsmuce", intervalSystem = "all", q = 2:36))
  expect_identical(stepFit(testy, family = "hsmuce", intervalSystem = "all", q = 1:36, lengths = 3:23),
                   stepFit(testy, family = "hsmuce", intervalSystem = "all", q = 3:23, lengths = 3:23))
  expect_identical(stepFit(testy, q = 1:36, family = "hsmuce", intervalSystem = "dyaLen"),
                   stepFit(testy, q = 2^(1:5), family = "hsmuce", intervalSystem = "dyaLen"))
  testq <- 2^(1:6)
  attr(testq, "n") <- 64L
  expect_identical(stepFit(testy, q = testq, family = "hsmuce", intervalSystem = "dyaPar"),
                   stepFit(testy, q = 2^(1:5), family = "hsmuce", intervalSystem = "dyaPar"))

  ret <- stepFit(testy, family = "hsmuce", alpha = 0.1, stat = teststat)
  expect_identical(ret, stepFit(testy, family = "hsmuce", alpha = 0.1, stat = teststat,
                                nq = testn, intervalSystem = "dyaPar", lengths = 2^(1:5),
                                penalty = "weights", weights = rep(0.2, 5)))
  expect_identical(ret, stepFit(testy, family = "hsmuce",
                                q = critVal(family = "hsmuce", alpha = 0.1, stat = teststat, n = testn)))
  
  expect_error(stepFit(testy, family = "hsmuce", alpha = "s", stat = teststat))
  expect_identical(stepFit(testy, family = "hsmuce", alpha = 0.075, stat = teststat),
                   stepFit(testy, family = "hsmuce",
                           q = critVal(alpha = 0.075, family = "hsmuce", stat = teststat, n = testn)))
  
  expect_error(stepFit(testy, family = "hsmuce", alpha = 0.1, stat = teststat, n = testn))
  expect_error(stepFit(testy, alpha = 0.1, family = "hsmuce", weights = NA, stat = teststat))
  
  teststat <- monteCarloSimulation(n = 36L, r = 100L, family = "hsmuce", intervalSystem = "all")
  expect_identical(stepFit(testy, family = "hsmuce", alpha = 0.14, penalty = "log", stat = teststat,
                           intervalSystem = "all", lengths = c(2, 5, 8, 23)),
                   stepFit(testy, family = "hsmuce", intervalSystem = "all", lengths = c(2, 5, 8, 23),
                           q = critVal(alpha = 0.14, family = "hsmuce", intervalSystem = "all",
                                       lengths = c(2, 5, 8, 23),
                                       penalty = "log", stat = teststat, n = testn)))
  teststat <- monteCarloSimulation(n = 36L, r = 100L, family = "hsmuce", intervalSystem = "dyaLen")
  expect_identical(stepFit(testy, family = "hsmuce", alpha = 0.034, penalty = "none", stat = teststat,
                           intervalSystem = "dyaLen", lengths = c(2, 4, 8, 32)),
                   stepFit(testy, family = "hsmuce", intervalSystem = "dyaLen", lengths = c(2, 4, 8, 32),
                           q = critVal(alpha = 0.034, family = "hsmuce", intervalSystem = "dyaLen",
                                       lengths = c(2, 4, 8, 32),
                                       penalty = "none", stat = teststat, n = testn)))
  teststat <- monteCarloSimulation(n = 36L, r = 100L, family = "hsmuce")
  expect_identical(stepFit(testy, family = "hsmuce", alpha = 0.56, penalty = "weights",
                           weights = c(0.2, 0.3, 0.4, 0.1),
                           stat = teststat, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32)),
                   stepFit(testy, family = "hsmuce", intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                           q = critVal(alpha = 0.56, family = "hsmuce", intervalSystem = "dyaPar", 
                                       lengths = c(2, 4, 8, 32), penalty = "weights",
                                       weights = c(0.2, 0.3, 0.4, 0.1), stat = teststat, n = testn)))
  
  expect_identical(stepFit(testy, family = "hsmuce", alpha = 0.014,
                           stat = teststat, nq = 100L, 
                           intervalSystem = "dyaPar", lengths = 2^c(1:3, 5)),
                   stepFit(testy, family = "hsmuce", intervalSystem = "dyaPar", lengths = 2^c(1:3, 5),
                           q = critVal(alpha = 0.014, family = "hsmuce", intervalSystem = "dyaPar",
                                       lengths = 2^c(1:3, 5), stat = teststat, n = testn, nq = 100L)))
  
  expect_error(stepFit(testy, family = "hsmuce", alpha = 0.1, output = "vector", stat = teststat))
  expect_error(stepFit(testy, family = "hsmuce", alpha = 0.1, data = 1, stat = teststat))
  
  expect_error(stepFit(testy, alpha = 0.1, family = "hsmuce", stat = rnorm(1e4)))
  
  teststatmatrix <- monteCarloSimulation(n = 36L, r = 100L, intervalSystem = "all", family = "hsmuce")
  teststatvector <- monteCarloSimulation(n = 36L, r = 100L, output = "maximum", intervalSystem = "all",
                                         penalty = "sqrt", family = "hsmuce")
  expect_identical(stepFit(testy, family = "hsmuce", intervalSystem = "all", penalty = "sqrt", alpha = 0.05,
                           stat = teststatvector),
                   stepFit(testy, family = "hsmuce", intervalSystem = "all",
                           q = critVal(family = "hsmuce", intervalSystem = "all", alpha = 0.05, penalty = "sqrt",
                                       stat = teststatmatrix, n = testn)))
  
  teststatmatrix <- monteCarloSimulation(n = 36L, r = 100L, intervalSystem = "dyaPar", family = "hsmuce")
  teststatvector <- monteCarloSimulation(n = 36L, r = 100L, output = "maximum", intervalSystem = "dyaPar",
                                         penalty = "sqrt", family = "hsmuce", lengths = c(2, 8, 16, 32))
  expect_identical(stepFit(testy, alpha = 0.122, stat = teststatvector, nq = 2^9L,
                           family = "hsmuce", intervalSystem = "dyaPar", lengths = c(2, 8, 16, 32),
                           penalty = "sqrt"),
                   stepFit(testy, family = "hsmuce", intervalSystem = "dyaPar", lengths = c(2, 8, 16, 32),
                           q = critVal(alpha = 0.122, stat = teststatmatrix, n = testn, nq = 2^9L,
                                       family = "hsmuce", intervalSystem = "dyaPar", lengths = c(2, 8, 16, 32),
                                       penalty = "sqrt")))
  
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, intervalSystem = "dyaPar",
                           lengths = c(2, 4, 8), penalty = "log", family = "hsmuce",
                           options = list(simulation = "vector", save = list(), load = list())),
                   stepFit(testy, intervalSystem = "dyaPar", family = "hsmuce", lengths = c(2, 4, 8),
                           q = critVal(n = length(testy), alpha = 0.1, r = 100L, intervalSystem = "dyaPar",
                                       lengths = c(2, 4, 8), penalty = "log", family = "hsmuce",
                                       options = list(simulation = "vector", save = list(), load = list()))))
  
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, family = "hsmuce", weights = c(0.4, 0.2, 0.1, 0.1, 0.2),
                           options = list(simulation = "matrixIncreased", save = list(), load = list())),
                   stepFit(testy, family = "hsmuce",
                           q = critVal(n = length(testy), alpha = 0.1, r = 100L, family = "hsmuce"
                                       , weights = c(0.4, 0.2, 0.1, 0.1, 0.2),
                                       options = list(simulation = "matrixIncreased", save = list(),
                                                      load = list()))))
})

test_that("arguments confband and jumpint work and are tested for family 'hsmuce'", {
  testn <- 40L
  testy <- c(rnorm(10L, 0.5), rnorm(10L, 5, 0.3), rnorm(10L, 10, 0.2), rnorm(10L, 15, 0.6))
  testq <- c(1e5, 1e4, 1e3, 1e2, 1e1, rep(5, 35))
  
  s <- stepFit(testy, q = testq, family = "hsmuce", confband = TRUE)
  bounds <- computeBounds(testy, q = testq, family = "hsmuce")
  
  testx <- 1:testn
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostHsmuce, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostHsmuce, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  s2 <- stepFit(testy, q = testq, family = "hsmuce", confband = FALSE, jumpint = TRUE)
  s3 <- stepFit(testy, q = testq, family = "hsmuce", confband = FALSE, jumpint = FALSE)
  
  attr(s2, "confband") <- attr(s, "confband")
  expect_equal(s2, s, tolerance = 1e-12)
  
  s3$leftEndLeftBound <- s$leftEndLeftBound
  s3$leftEndRightBound <- s$leftEndRightBound
  s3$rightEndLeftBound <- s$rightEndLeftBound
  s3$rightEndRightBound <- s$rightEndRightBound
  s3$leftIndexLeftBound <- s$leftIndexLeftBound
  s3$leftIndexRightBound <- s$leftIndexRightBound
  s3$rightIndexLeftBound <- s$rightIndexLeftBound
  s3$rightIndexRightBound <- s$rightIndexRightBound
  attr(s3, "confband") <- attr(s, "confband")
  expect_equal(s3, s, tolerance = 1e-12)
  
  
  testn <- 16L
  testy <- rnorm(testn)
  testq <- c(1e5, 1e4, 1e3, 1e2, 1e1, rep(5, 11))
  
  s <- stepFit(testy, q = testq, family = "hsmuce", confband = TRUE)
  bounds <- computeBounds(testy, q = testq, family = "hsmuce")
  
  testx <- 1:testn
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostHsmuce, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostHsmuce, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  s2 <- stepFit(testy, q = testq, family = "hsmuce", confband = FALSE, jumpint = TRUE)
  s3 <- stepFit(testy, q = testq, family = "hsmuce", confband = FALSE, jumpint = FALSE)
  
  attr(s2, "confband") <- attr(s, "confband")
  expect_equal(s2, s, tolerance = 1e-12)
  
  s3$leftEndLeftBound <- s$leftEndLeftBound
  s3$leftEndRightBound <- s$leftEndRightBound
  s3$rightEndLeftBound <- s$rightEndLeftBound
  s3$rightEndRightBound <- s$rightEndRightBound
  s3$leftIndexLeftBound <- s$leftIndexLeftBound
  s3$leftIndexRightBound <- s$leftIndexRightBound
  s3$rightIndexLeftBound <- s$rightIndexLeftBound
  s3$rightIndexRightBound <- s$rightIndexRightBound
  attr(s3, "confband") <- attr(s, "confband")
  expect_equal(s3, s, tolerance = 1e-12)
  
  testn <- 16L
  testy <- c(rnorm(testn / 2), rnorm(testn / 2, 20, 0.5))
  testq <- c(1e5, 1e4, 1e3, 1e2, 1e1, rep(5, 11))
  
  s <- stepFit(testy, q = testq, family = "hsmuce", confband = TRUE)
  bounds <- computeBounds(testy, q = testq, family = "hsmuce")
  
  testx <- 1:testn
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostHsmuce, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostHsmuce, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  s2 <- stepFit(testy, q = testq, family = "hsmuce", confband = FALSE, jumpint = TRUE)
  s3 <- stepFit(testy, q = testq, family = "hsmuce", confband = FALSE, jumpint = FALSE)
  
  attr(s2, "confband") <- attr(s, "confband")
  expect_equal(s2, s, tolerance = 1e-12)
  
  s3$leftEndLeftBound <- s$leftEndLeftBound
  s3$leftEndRightBound <- s$leftEndRightBound
  s3$rightEndLeftBound <- s$rightEndLeftBound
  s3$rightEndRightBound <- s$rightEndRightBound
  s3$leftIndexLeftBound <- s$leftIndexLeftBound
  s3$leftIndexRightBound <- s$leftIndexRightBound
  s3$rightIndexLeftBound <- s$rightIndexLeftBound
  s3$rightIndexRightBound <- s$rightIndexRightBound
  attr(s3, "confband") <- attr(s, "confband")
  expect_equal(s3, s, tolerance = 1e-12)
})

test_that("family 'mDependentPS' works", {
  testn <- 40L
  testy <- rnorm(testn)
  testq <- rep(4, testn)
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.8, 0.5, 0.3), lag.max = 3))
  
  expect_error(stepFit(family = "mDependentPS", q = testq, covariances = testcovariances))
  expect_identical(stepFit(testy, family = "mDependentPS", q = testq, covariances = testcovariances),
                   stepFit(testy, x = 1:testn, x0 = 0, family = "mDependentPS", intervalSystem = "dyaLen",
                           lengths = 2^(0:5), q = testq, confband = FALSE, jumpint = FALSE,
                           covariances = testcovariances))
  expect_error(stepFit(as.integer(testy), family = "mDependentPS", q = testq, covariances = testcovariances))
  expect_error(stepFit(c(testy, "s"), family = "mDependentPS", q = testq, covariances = testcovariances))
  expect_error(stepFit(c(rnorm(10), NA), family = "mDependentPS", q = testq, covariances = testcovariances)) 
  
  s <- stepFit(testy, q = testq, family = "mDependentPS", confband = TRUE, covariances = testcovariances)
  bounds <- computeBounds(testy, q = testq, family = "mDependentPS", covariances = testcovariances)
  
  testx <- 1:testn
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testy <- c(rnorm(40, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(40, 40))
  testn <- length(testy)
  testq <- rep(4, testn)
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.8, 0.4, 0.2), lag.max = 3))
  
  testx <- 1:testn / 1e4
  s <- stepFit(testy, x = testx, q = testq, family = "mDependentPS", confband = TRUE,
               covariances = testcovariances)
  bounds <- computeBounds(testy, q = testq, family = "mDependentPS",
                          covariances = testcovariances)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testy <- c(rnorm(20, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(20, 40))
  testn <- length(testy)
  testq <- rep(5, 55)
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.9, 0.7, 0.5, 0.3), lag.max = 4))
  
  testx <- 1:testn / 5.34
  s <- stepFit(testy, x = testx, x0 = -1, q = testq, family = "mDependentPS", confband = TRUE,
               covariances = testcovariances)
  bounds <- computeBounds(testy, q = testq, family = "mDependentPS",
                          covariances = testcovariances)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testn <- 23L
  testy <- c(rnorm(10, 1, 0.23), rnorm(testn - 10, -1, 0.34))
  testq <- rep(4, 23)
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.5, 0.3), lag.max = 2))
  
  expect_identical(stepFit(testy, family = "mDependentPS", q = testq, covariances = testcovariances),
                   stepFit(testy, family = "mDependentPS", q = testq, intervalSystem = "dyaLen",
                           covariances = testcovariances))
  
  testx <- 1:testn
  s <- stepFit(testy, q = testq, family = "mDependentPS", intervalSystem = "all", confband = TRUE,
               covariances = testcovariances)
  bounds <- computeBounds(testy, q = testq, family = "mDependentPS", intervalSystem = "all",
                          covariances = testcovariances)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testx <- 1:testn
  s <- stepFit(testy, q = testq, family = "mDependentPS", intervalSystem = "dyaPar", confband = TRUE,
               covariances = testcovariances)
  bounds <- computeBounds(testy, q = testq, family = "mDependentPS", intervalSystem = "dyaPar",
                          covariances = testcovariances)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testn <- 36L
  testy <- c(rnorm(12, 1, 0.13), rnorm(12, -1, 0.23), rnorm(12, 1, 0.43))
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.9, 0.65, 0.34, 0.27, 0.1, 0.05), lag.max = 6)) /
    10
  testq <- rep(4, 36)
  
  expect_equal(stepFit(testy, family = "mDependentPS", intervalSystem = "all", lengths = 2^(0:5), q = testq,
                       covariances = testcovariances),
               stepFit(testy, family = "mDependentPS", intervalSystem = "dyaLen", q = testq,
                       covariances = testcovariances))
  
  testq <- 9:1
  testlengths = c(1, 5:10, 35:36)
  testx <- 1:testn
  s <- stepFit(testy, q = testq, family = "mDependentPS", intervalSystem = "all", lengths = testlengths,
               confband = TRUE, covariances = testcovariances)
  bounds <- computeBounds(testy, q = testq, family = "mDependentPS", intervalSystem = "all",
                          lengths = testlengths, covariances = testcovariances)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testq <- rep(4, 4)
  testlengths = c(1, 2, 4, 16)
  testx <- 1:testn
  s <- stepFit(testy, q = testq, family = "mDependentPS", lengths = testlengths,
               confband = TRUE, covariances = testcovariances)
  bounds <- computeBounds(testy, q = testq, family = "mDependentPS",
                          lengths = testlengths, covariances = testcovariances)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  testq <- c(4, 4)
  testlengths = c(1, 8)
  testx <- 1:testn
  s <- stepFit(testy, q = testq, family = "mDependentPS", intervalSystem = "dyaPar", lengths = testlengths,
               confband = TRUE, covariances = testcovariances)
  bounds <- computeBounds(testy, q = testq, family = "mDependentPS", intervalSystem = "dyaPar",
                          lengths = testlengths, covariances = testcovariances)
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
})

test_that("argument q is tested and works for family 'mDependentPS'", {
  testn <- 36L
  testy <- c(rnorm(12, 10, 0.13), rnorm(12, -10, 0.13), rnorm(12, 10, 0.13))
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.8, 0.5, 0.3), lag.max = 3))
  teststat <- monteCarloSimulation(n = 36L, r = 100L, family = "mDependentPS", covariances = testcovariances)
  
  expect_warning(ret <- stepFit(testy, family = "mDependentPS", covariances = testcovariances))
  expect_identical(ret, stepFit(testy, family = "mDependentPS", covariances = testcovariances, alpha = 0.5))
  expect_error(stepFit(testy, q = rep(1, 7), alpha = 0.1, stat = teststat, family = "mDependentPS",
                       covariances = testcovariances))
  expect_error(stepFit(testy, q = rep(1, 4), alpha = 0.1, stat = teststat, family = "mDependentPS",
                       covariances = testcovariances))
  
  expect_identical(stepFit(testy, q = 3, family = "mDependentPS", intervalSystem = "all",
                           lengths = c(2:3, 8:23), penalty = "sqrt", covariances = testcovariances),
                   stepFit(testy, family = "mDependentPS", intervalSystem = "all", lengths = c(2:3, 8:23),
                           covariances = testcovariances,
                           q = critVal(q = 3, family = "mDependentPS", intervalSystem = "all",
                                       lengths = c(2:3, 8:23), n = testn, penalty = "sqrt", 
                                       covariances = testcovariances)))
  expect_identical(stepFit(testy, q = 3, family = "mDependentPS", intervalSystem = "dyaLen",
                           lengths = c(2, 4, 8, 32), nq = 45L, penalty = "none",
                           covariances = testcovariances),
                   stepFit(testy, family = "mDependentPS", intervalSystem = "dyaLen",
                           lengths = c(2, 4, 8, 32), covariances = testcovariances,
                           q = critVal(q = 3, family = "mDependentPS", intervalSystem = "dyaLen",
                                       lengths = c(2, 4, 8, 32), n = testn, nq = 45L, penalty = "none",
                                       covariances = testcovariances)))
  expect_identical(stepFit(testy, q = 3, family = "mDependentPS", intervalSystem = "dyaPar",
                           lengths = c(2, 4, 8, 32), penalty = "log", covariances = testcovariances),
                   stepFit(testy, family = "mDependentPS", intervalSystem = "dyaPar",
                           lengths = c(2, 4, 8, 32), covariances = testcovariances,
                           q = critVal(q = 3, family = "mDependentPS", intervalSystem = "dyaPar",
                                       lengths = c(2, 4, 8, 32), n = testn, penalty = "log",
                                       covariances = testcovariances)))
  
  testq <- 1:45
  attr(testq, "n") <- 45L
  expect_identical(stepFit(testy, family = "mDependentPS", intervalSystem = "all", q = testq,
                           covariances = testcovariances),
                   stepFit(testy, family = "mDependentPS", intervalSystem = "all", q = 1:36,
                           covariances = testcovariances))
  expect_identical(stepFit(testy, family = "mDependentPS", intervalSystem = "all", q = 1:36,
                           lengths = 3:23, covariances = testcovariances),
                   stepFit(testy, family = "mDependentPS", intervalSystem = "all", q = 3:23,
                           lengths = 3:23, covariances = testcovariances))
  expect_identical(stepFit(testy, q = 1:36, family = "mDependentPS", intervalSystem = "dyaLen",
                           covariances = testcovariances),
                   stepFit(testy, q = 2^(0:5), family = "mDependentPS", intervalSystem = "dyaLen",
                           covariances = testcovariances))
  testq <- 2^(0:6)
  attr(testq, "n") <- 64L
  expect_identical(stepFit(testy, q = testq, family = "mDependentPS",
                           intervalSystem = "dyaPar", covariances = testcovariances),
                   stepFit(testy, q = 2^(0:5), family = "mDependentPS", intervalSystem = "dyaPar",
                           covariances = testcovariances))
  
  ret <- stepFit(testy, family = "mDependentPS", alpha = 0.1, stat = teststat,
                 covariances = testcovariances)
  expect_identical(ret, stepFit(testy, family = "mDependentPS", alpha = 0.1, stat = teststat,
                                nq = testn, intervalSystem = "dyaLen", lengths = 2^(0:5),
                                penalty = "sqrt", covariances = testcovariances))
  expect_identical(ret, stepFit(testy, family = "mDependentPS", covariances = testcovariances,
                                q = critVal(family = "mDependentPS", alpha = 0.1, stat = teststat,
                                            n = testn, covariances = testcovariances)))
  
  expect_error(stepFit(testy, family = "mDependentPS", alpha = "s", stat = teststat,
                       covariances = testcovariances))
  expect_identical(stepFit(testy, family = "mDependentPS", alpha = 0.075, stat = teststat,
                           covariances = testcovariances),
                   stepFit(testy, family = "mDependentPS", covariances = testcovariances,
                           q = critVal(alpha = 0.075, family = "mDependentPS", stat = teststat,
                                       n = testn, covariances = testcovariances)))
  
  expect_error(stepFit(testy, family = "mDependentPS", alpha = 0.1, stat = teststat, n = testn,
                       covariances = testcovariances))
  expect_error(stepFit(testy, alpha = 0.1, family = "mDependentPS", penalty = "weights", weights = NA,
                       stat = teststat, covariances = testcovariances))
  
  teststat <- monteCarloSimulation(n = 36L, r = 100L, family = "mDependentPS", covariances = testcovariances,
                                   intervalSystem = "all")
  expect_identical(stepFit(testy, family = "mDependentPS", alpha = 0.14, penalty = "log", stat = teststat,
                           intervalSystem = "all", lengths = c(2, 5, 8, 23),
                           covariances = testcovariances),
                   stepFit(testy, family = "mDependentPS", intervalSystem = "all",
                           lengths = c(2, 5, 8, 23),
                           covariances = testcovariances,
                           q = critVal(alpha = 0.14, family = "mDependentPS", intervalSystem = "all",
                                       lengths = c(2, 5, 8, 23), penalty = "log", stat = teststat,
                                       n = testn, covariances = testcovariances)))
  teststat <- monteCarloSimulation(n = 36L, r = 100L, family = "mDependentPS", covariances = testcovariances,
                                   intervalSystem = "dyaLen")
  expect_identical(stepFit(testy, family = "mDependentPS", alpha = 0.034, penalty = "none",
                           stat = teststat,
                           intervalSystem = "dyaLen", lengths = c(2, 4, 8, 32),
                           covariances = testcovariances),
                   stepFit(testy, family = "mDependentPS", intervalSystem = "dyaLen",
                           lengths = c(2, 4, 8, 32), covariances = testcovariances,
                           q = critVal(alpha = 0.034, family = "mDependentPS", intervalSystem = "dyaLen",
                                       lengths = c(2, 4, 8, 32), penalty = "none", stat = teststat,
                                       n = testn, covariances = testcovariances)))
  teststat <- monteCarloSimulation(n = 36L, r = 100L, family = "mDependentPS", covariances = testcovariances,
                                   intervalSystem = "dyaPar")
  expect_identical(stepFit(testy, family = "mDependentPS", alpha = 0.56, penalty = "weights",
                           weights = c(0.2, 0.3, 0.4, 0.1),
                           stat = teststat, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                           covariances = testcovariances),
                   stepFit(testy, family = "mDependentPS", intervalSystem = "dyaPar",
                           lengths = c(2, 4, 8, 32), covariances = testcovariances,
                           q = critVal(alpha = 0.56, family = "mDependentPS", intervalSystem = "dyaPar", 
                                       lengths = c(2, 4, 8, 32), penalty = "weights",
                                       weights = c(0.2, 0.3, 0.4, 0.1), stat = teststat, n = testn,
                                       covariances = testcovariances)))
  
  expect_identical(stepFit(testy, family = "mDependentPS", alpha = 0.014,
                           stat = teststat, nq = 100L, 
                           intervalSystem = "dyaPar", lengths = 2^c(0:3, 5), covariances = testcovariances),
                   stepFit(testy, family = "mDependentPS", intervalSystem = "dyaPar", lengths = 2^c(0:3, 5),
                           covariances = testcovariances,
                           q = critVal(alpha = 0.014, family = "mDependentPS", intervalSystem = "dyaPar",
                                       lengths = 2^c(0:3, 5), stat = teststat, n = testn, nq = 100L,
                                       covariances = testcovariances)))
  
  expect_error(stepFit(testy, family = "mDependentPS", alpha = 0.1, output = "vector", stat = teststat,
                       covariances = testcovariances))
  expect_error(stepFit(testy, family = "mDependentPS", alpha = 0.1, data = 1, stat = teststat,
                       covariances = testcovariances))
  
  expect_error(stepFit(testy, family = "mDependentPS", covariances = testcovariances, alpha = 0.1,
                       output = "vector", stat = teststat))
  expect_error(stepFit(testy, family = "mDependentPS", covariances = testcovariances, alpha = 0.1, data = 1,
                       stat = teststat))
  
  expect_error(stepFit(testy, alpha = 0.1, family = "mDependentPS", covariances = testcovariances,
                       stat = rnorm(1e4), penalty = "weights"))
  
  teststatmatrix <- monteCarloSimulation(n = 36L, r = 100L, family = "mDependentPS",
                                         covariances = testcovariances, intervalSystem = "all")
  teststatvector <- monteCarloSimulation(n = 36L, r = 100L, family = "mDependentPS",
                                         covariances = testcovariances, output = "maximum",
                                         intervalSystem = "all")
  expect_identical(stepFit(testy, family = "mDependentPS", covariances = testcovariances,
                           intervalSystem = "all", penalty = "sqrt", alpha = 0.078, stat = teststatvector),
                   stepFit(testy, family = "mDependentPS", covariances = testcovariances,
                           intervalSystem = "all",
                           q = critVal(family = "mDependentPS", covariances = testcovariances,
                                       intervalSystem = "all", alpha = 0.078, penalty = "sqrt",
                                       stat = teststatmatrix, n = testn)))
  
  teststatmatrix <- monteCarloSimulation(n = 36L, r = 100L, family = "mDependentPS",
                                         covariances = testcovariances)
  teststatvector <- monteCarloSimulation(n = 36L, r = 100L, family = "mDependentPS",
                                         covariances = testcovariances, output = "maximum",
                                         lengths = c(2, 8, 16, 32))
  expect_identical(stepFit(testy, alpha = 0.122, stat = teststatvector, nq = 2^9L,
                           family = "mDependentPS", covariances = testcovariances,
                            lengths = c(2, 8, 16, 32)),
                   stepFit(testy, family = "mDependentPS", covariances = testcovariances,
                           lengths = c(2, 8, 16, 32),
                           q = critVal(alpha = 0.122, stat = teststatmatrix, n = testn, nq = 2^9L,
                                       family = "mDependentPS", covariances = testcovariances,
                                       lengths = c(2, 8, 16, 32))))
  
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, lengths = 3:17, penalty = "log", nq = 100,
                           family = "mDependentPS", covariances = testcovariances, intervalSystem = "all",
                           options = list(simulation = "vectorIncreased", save = list(), load = list())),
                   stepFit(testy, lengths = 3:17, family = "mDependentPS", covariances = testcovariances,
                           intervalSystem = "all",
                           q = critVal(n = 100, alpha = 0.1, r = 100L, lengths = 3:17, intervalSystem = "all",
                                       penalty = "log", family = "mDependentPS", covariances = testcovariances,
                                       options = list(simulation = "vectorIncreased", save = list(),
                                                      load = list()))))

  testStepR <- new.env()
  teststat <- monteCarloSimulation(36L, r = 100L, family = "mDependentPS",
                                   covariances = testcovariances)
  expect_identical(stepFit(testy, alpha = 0.1, r = 100L, family = "mDependentPS",
                           covariances = testcovariances,
                           options = list(simulation = "matrix", save = list(workspace = "matrix"),
                                          load = list(), envir = testStepR)),
                   stepFit(testy, alpha = 0.1, stat = teststat, family = "mDependentPS",
                           covariances = testcovariances, options = list()))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  expect_identical(critVal(36L, alpha = 0.1, r = 50L, output = "vector", family = "mDependentPS",
                           covariances = testcovariances + 1e-12,
                           options = list(simulation = "matrix", save = list(),
                                          load = list(workspace = "matrix"), envir = testStepR)),
                   critVal(36L, alpha = 0.1, stat = teststat, output = "vector", options = list(),
                           family = "mDependentPS", covariances = testcovariances))
  remove(critValStepRTab, envir = testStepR)
})

test_that("arguments confband and jumpint work and are tested for family 'mDependentPS'", {
  testn <- 40L
  testy <- c(rnorm(10L, 0.5), rnorm(10L, 5, 0.3), rnorm(10L, 10, 0.2), rnorm(10L, 15, 0.6))
  testq <- rep(5, 40)
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.8, 0.5, 0.3), lag.max = 3))
  
  s <- stepFit(testy, q = testq, family = "mDependentPS", confband = TRUE, covariances = testcovariances)
  bounds <- computeBounds(testy, q = testq, family = "mDependentPS", covariances = testcovariances)
  
  testx <- 1:testn
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  s2 <- stepFit(testy, q = testq, family = "mDependentPS", confband = FALSE, jumpint = TRUE,
                covariances = testcovariances)
  s3 <- stepFit(testy, q = testq, family = "mDependentPS", confband = FALSE, jumpint = FALSE,
                covariances = testcovariances)
  
  attr(s2, "confband") <- attr(s, "confband")
  expect_equal(s2, s, tolerance = 1e-12)
  
  s3$leftEndLeftBound <- s$leftEndLeftBound
  s3$leftEndRightBound <- s$leftEndRightBound
  s3$rightEndLeftBound <- s$rightEndLeftBound
  s3$rightEndRightBound <- s$rightEndRightBound
  s3$leftIndexLeftBound <- s$leftIndexLeftBound
  s3$leftIndexRightBound <- s$leftIndexRightBound
  s3$rightIndexLeftBound <- s$rightIndexLeftBound
  s3$rightIndexRightBound <- s$rightIndexRightBound
  attr(s3, "confband") <- attr(s, "confband")
  expect_equal(s3, s, tolerance = 1e-12)
  
  
  testn <- 16L
  testy <- rnorm(testn)
  testq <- rep(5, 16)
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.8, 0.7, 0.6, 0.5, 0.4, 0.3), lag.max = 6))
  
  s <- stepFit(testy, q = testq, family = "mDependentPS", confband = TRUE, covariances = testcovariances)
  bounds <- computeBounds(testy, q = testq, family = "mDependentPS", covariances = testcovariances)
  
  testx <- 1:testn
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  s2 <- stepFit(testy, q = testq, family = "mDependentPS", confband = FALSE, jumpint = TRUE,
                covariances = testcovariances)
  s3 <- stepFit(testy, q = testq, family = "mDependentPS", confband = FALSE, jumpint = FALSE,
                covariances = testcovariances)
  
  attr(s2, "confband") <- attr(s, "confband")
  expect_equal(s2, s, tolerance = 1e-12)
  
  s3$leftEndLeftBound <- s$leftEndLeftBound
  s3$leftEndRightBound <- s$leftEndRightBound
  s3$rightEndLeftBound <- s$rightEndLeftBound
  s3$rightEndRightBound <- s$rightEndRightBound
  s3$leftIndexLeftBound <- s$leftIndexLeftBound
  s3$leftIndexRightBound <- s$leftIndexRightBound
  s3$rightIndexLeftBound <- s$rightIndexLeftBound
  s3$rightIndexRightBound <- s$rightIndexRightBound
  attr(s3, "confband") <- attr(s, "confband")
  expect_equal(s3, s, tolerance = 1e-12)
  
  testn <- 16L
  testy <- c(rnorm(testn / 2), rnorm(testn / 2, 20, 0.5))
  testq <- rep(5, 16)
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.8, 0.8, 0.8), lag.max = 3))
  
  s <- stepFit(testy, q = testq, family = "mDependentPS", confband = TRUE, covariances = testcovariances)
  bounds <- computeBounds(testy, q = testq, family = "mDependentPS", covariances = testcovariances)
  
  testx <- 1:testn
  testConfInt(s = s, b = bounds, x = testx, n = testn, tolerance = 1e-9)
  testFeasible(s = s, b = bounds, tolerance = 1e-9) 
  testValues(s = s, b = bounds, localEst = localEstGauss, y = testy, tolerance = 1e-9)
  testCosts(s = s, y = testy, localCost = localCostGauss, tolerance = 1e-9)
  testOptimality(s = s, b = bounds, y = testy, localCost = localCostGauss, localEst = localEstGauss, 
                 tolerance = 1e-9)
  testBand(s = s, b = bounds, x = testx, tolerance = 1e-9)
  
  s2 <- stepFit(testy, q = testq, family = "mDependentPS", confband = FALSE, jumpint = TRUE,
                covariances = testcovariances)
  s3 <- stepFit(testy, q = testq, family = "mDependentPS", confband = FALSE, jumpint = FALSE,
                covariances = testcovariances)
  
  attr(s2, "confband") <- attr(s, "confband")
  expect_equal(s2, s, tolerance = 1e-12)
  
  s3$leftEndLeftBound <- s$leftEndLeftBound
  s3$leftEndRightBound <- s$leftEndRightBound
  s3$rightEndLeftBound <- s$rightEndLeftBound
  s3$rightEndRightBound <- s$rightEndRightBound
  s3$leftIndexLeftBound <- s$leftIndexLeftBound
  s3$leftIndexRightBound <- s$leftIndexRightBound
  s3$rightIndexLeftBound <- s$rightIndexLeftBound
  s3$rightIndexRightBound <- s$rightIndexRightBound
  attr(s3, "confband") <- attr(s, "confband")
  expect_equal(s3, s, tolerance = 1e-12)
})


test_that("arguments in ... are tested and work for family mDependentPS", {
  testn <- 17L
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.8, 0.5, 0.3), lag.max = 3))
  testcorrelations <- testcovariances / testcovariances[1]
  testsignal <- list(leftIndex = c(1L, 13L), rightIndex = c(12L, testn), value = c(0, -1))
  testfilter <- list(acf = testcorrelations)
  class(testfilter) <- c("lowpassFilter", class(testfilter))
  testy <- as.numeric(arima.sim(n = testn, list(ar = c(), ma = c(0.8, 0.5, 0.3)), sd = 1))
  testq = 17:1 / 3
  
  expect_error(stepFit(testy, family = "mDependentPS", q = testq, covariances = testcovariances, std = 1))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq, correlations = testcorrelations, std = 1))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq, filter = testfilter, std = 1))
  expect_error(stepFit(testy, family = "mDependentPS", intervalsystem = "all"))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq, sd = 1))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq,
                       covariances = c(testcovariances, "s")))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq,
                       covariances = c(testcovariances, NA)))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq,
                       covariances = c(testcovariances, Inf)))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq,
                       covariances = c(0.01, testcovariances)))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq,
                       covariances = c(-1, testcovariances)))
  
  expect_error(stepFit(testy, family = "mDependentPS", q = testq,
                       correlations = c(testcorrelations, "s")))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq,
                       correlations = c(testcorrelations, NA)))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq,
                       correlations = c(testcorrelations, Inf)))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq,
                       correlations = c(testcorrelations, 1.1)))
  expect_error(cstepFit(testy, family = "mDependentPS", q = testq,
                        correlations = c(0.99, testcorrelations[-1])))
  
  expect_error(stepFit(testy, family = "mDependentPS", q = testq, sd = "s",
                       correlations = testcorrelations))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq, sd = c(1, 2),
                       correlations = testcorrelations))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq, sd = NA,
                       correlations = testcorrelations))
  expect_error(stepFit(c(1, 2), q = c(5, 4), family = "mDependentPS", correlations = testcorrelations))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq, sd = Inf,
                       correlations = testcorrelations))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq, sd = 0,
                       correlations = testcorrelations))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq, sd = -0.1,
                       correlations = testcorrelations))
  
  expect_error(stepFit(testy, family = "mDependentPS", q = testq,
                       filter = list(param = list(acf = testcorrelations))))
  
  expect_error(stepFit(testy, family = "mDependentPS", q = testq, sd = "s", filter = testfilter))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq, sd = c(1, 2), filter = testfilter))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq, sd = NA, filter = testfilter))
  expect_error(stepFit(c(1, 2), q = c(5, 4), family = "mDependentPS", filter = testfilter))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq, sd = Inf, filter = testfilter))
  expect_error(stepFit(testy, family = "mDependentPS", q = testq, sd = 0, filter = testfilter))
  expect_error(cstepFit(testy, family = "mDependentPS", q = testq, sd = -0.1, filter = testfilter))
  
  expect_identical(stepFit(testy, family = "mDependentPS", q = testq,
                           covariances = sdrobnorm(testy, lag = 4)^2 * testcorrelations),
                   stepFit(testy, family = "mDependentPS", q = testq, correlations = testcorrelations))
  expect_identical(stepFit(testy, family = "mDependentPS", q = testq,
                           covariances = 1.1^2 * testcorrelations),
                   stepFit(testy, family = "mDependentPS", q = testq,
                           correlations = testcorrelations, sd = 1.1))
  expect_identical(stepFit(testy, family = "mDependentPS", q = testq,
                           covariances = sdrobnorm(testy, lag = 4)^2 * testcorrelations),
                   stepFit(testy, family = "mDependentPS", q = testq, filter = testfilter))
  expect_identical(stepFit(testy, family = "mDependentPS", q = testq,
                           covariances = 1.1^2 * testcorrelations),
                   stepFit(testy, family = "mDependentPS", q = testq, filter = testfilter, sd = 1.1))
})
