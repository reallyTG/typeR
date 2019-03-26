test_that("Main operator functionality", {
  # Main functionality
  Mcheck <- matrix(c(1, 0.2, -0.3, 0.4,
                     0.2, 1, 0.6, -0.4,
                     -0.3, 0.6, 1, 0.4,
                     0.4, -0.4, 0.4, 1),
                   nrow = 4,
                   ncol = 4,
                   byrow = TRUE)

  main %<-% "   1,  0.2, -0.3,  0.4
              0.2,    1,  0.6, -0.4
             -0.3,  0.6,    1,  0.4
              0.4, -0.4,  0.4,    1"
  expect_equal(main, Mcheck)

  # Matrix input
  expect_error(mat %<-% Mcheck)

  # Lower triangular
  ltri %<-% "   1
              0.2,    1
             -0.3,  0.6,    1
              0.4, -0.4,  0.4,    1"
  expect_equal(ltri, Mcheck)

  # backslashes
  bsls %<-% " 1, 0.2, -0.3, 0.4 \\ 0.2, 1, 0.6, -0.4 \\ -0.3, 0.6, 1, 0.4
              0.4, -0.4, 0.4, 1"
  expect_equal(bsls, Mcheck)

  # variables
  a <- 0.2
  b <- -1
  vars %<-% "    1
                 a,     1
             b*0.3,   3*a,    1
               2*a, 2*b*a,  2*a,    1"
  expect_equal(vars, Mcheck)

  # complex matrices
  Ccheck <- matrix(c(1+2i, 2+1i, 3+4i, 4+0.5i, 5+2i, 6+4i), 2, byrow = TRUE)
  C %<-% "  1+2i, 2+1i, 3+4i
          4+0.5i, 5+2i, 6+4i"
  expect_equal(C, Ccheck)
})

test_that("Forward assignment operator", {
  Mcheck <- matrix(c(1, 0.2, -0.3, 0.4,
                     0.2, 1, 0.6, -0.4,
                     -0.3, 0.6, 1, 0.4,
                     0.4, -0.4, 0.4, 1),
                   nrow = 4,
                   ncol = 4,
                   byrow = TRUE)
  "   1,  0.2, -0.3,  0.4
    0.2,    1,  0.6, -0.4
   -0.3,  0.6,    1,  0.4
    0.4, -0.4,  0.4,    1" %->% main
  expect_equal(main, Mcheck)

  expect_error(Mcheck %->% mat)
})
