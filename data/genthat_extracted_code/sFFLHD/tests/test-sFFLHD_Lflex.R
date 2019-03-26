context("sFFLHD_Lflex test")

test_that("Lflex works properly", {
  set.seed(0)
  # Get Lflex D=8, L=4, has to use L=8
  s <- sFFLHD_Lflex$new(D=8,L=4)
  # Check classes
  expect_is(s, "R6")
  expect_is(s, "sFFLHD_Lflex")
  # Check that it is actually using 8
  expect_equal(s$L_used, 8)
  # Expect batch is matrix with 4 rows
  sb1 <- s$get.batch()
  expect_is(sb1, "matrix")
  expect_equal(nrow(sb1), 4)
  # Expect that it has the remaining 4 of the 8 waiting as choices
  expect_equal(nrow(s$Xchoices), 4)
  sb2 <- s$get.batch()
  expect_equal(nrow(s$Xchoices), 0)
  # Check that the first two batches combined make a LH
  sb12 <- rbind(sb1, sb2)
  expect_true(all(apply(sb12, 2, function(coli) {all(sort(floor(8*coli)) == 0:7)})))


  set.seed(0)
  # Get Lflex D=7, L=10, has to use L=9 or L=11, picks 9
  s <- sFFLHD_Lflex$new(D=7,L=10)
  # Check classes
  expect_is(s, "R6")
  expect_is(s, "sFFLHD_Lflex")
  # Check that it is actually using 9
  expect_equal(s$L_used, 9)
  # Expect batch is matrix with 10 rows
  sb1 <- s$get.batch()
  expect_is(sb1, "matrix")
  expect_equal(nrow(sb1), 10)
  # Expect that it has the remaining 8 of the 18 waiting as choices
  expect_equal(nrow(s$Xchoices), 8)
  sb2 <- s$get.batch()
  expect_equal(nrow(s$Xchoices), 7)
  # Check that the first nine batches combined make a LH and OA
  sb12 <- rbind(sb1, sb2, s$get.batches(7))
  lhsmat <- sb12[1:81, ]
  expect_true(all(apply(lhsmat, 2, function(coli) {all(sort(floor(81*coli)) == 0:80)})))
})

test_that("Lflex prefer_L properly", {
  # Make sure that prefer_L works
  s <- sFFLHD_Lflex$new(D=7,L=10)
  expect_equal(s$L_used, 9)
  s <- sFFLHD_Lflex$new(D=7,L=10, prefer_L="down")
  expect_equal(s$L_used, 9)
  s <- sFFLHD_Lflex$new(D=7,L=10, prefer_L="up")
  expect_equal(s$L_used, 11)
  s <- sFFLHD_Lflex$new(D=7,L=10, prefer_L="near")
  expect_equal(s$L_used, 9)
  s <- sFFLHD_Lflex$new(D=7,L=12, prefer_L="up")
  expect_equal(s$L_used, 11)

  s <- sFFLHD_Lflex$new(D=11,L=2, prefer_L="down")
  expect_equal(s$L_used, 11)
  s <- sFFLHD_Lflex$new(D=11,L=2, prefer_L="up")
  expect_equal(s$L_used, 11)
  s <- sFFLHD_Lflex$new(D=11,L=2, prefer_L="near")
  expect_equal(s$L_used, 11)

  expect_error(sFFLHD_Lflex$new(D=11,L=2, prefer_L="nar")) # purposeful misspell to get an error
  expect_error(sFFLHD_Lflex$new(D=11,L=2, prefer_L=TRUE)) # Should be error too

  expect_error(sFFLHD_Lflex$new(D=13,L=4))

})

test_that("Works fine when L is good", {
  s <- sFFLHD_Lflex$new(D=2,L=4)
  expect_equal(s$L_used, 4)
})
