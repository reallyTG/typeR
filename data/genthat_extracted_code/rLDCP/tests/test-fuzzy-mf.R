
context("fuzzy_mf")

test_that("define trapezoid", {
  mytrap <- trapezoid_mf(0, 1, 2, 3)
  expect_that (class(mytrap), equals("trapezoid_mf"))
  expect_that (mytrap$a, equals(0))
  expect_that (mytrap$b, equals(1))
  expect_that (mytrap$c, equals(2))
  expect_that (mytrap$d, equals(3))
})

test_that("define trapezoid with illegal conditions a > b and c > d", {
  expect_error(trapezoid_mf(1, 0, 1, 2))
  expect_error(trapezoid_mf(0,1,1,0))
})

test_that("define triangle", {
  mytri <- triangle_mf(0, 1, 2)
  expect_that (class(mytri), equals("triangle_mf"))
  expect_that (mytri$a, equals(0))
  expect_that (mytri$b, equals(1))
  expect_that (mytri$c, equals(2))
})

test_that("define triangle with illegal conditions a > b and c < b", {
  expect_error(triangle_mf(1, 0, 1))
  expect_error(triangle_mf(0,1,0))
})

test_that("define fuzzy partitions", {

  listfp <- list(triangle_mf(450,450,550),
                 triangle_mf(450,550,600),
                 trapezoid_mf(550,600,800, 1000),
                 triangle_mf(800,1000,1300),
                 trapezoid_mf(1000,1300,1500,1500))

  class(listfp) <- "fuzzy_partitions"

 fp <- fuzzy_partitions(triangle_mf(450,450,550),
                                    triangle_mf(450,550,600),
                                     trapezoid_mf(550,600,800, 1000),
                                    triangle_mf(800,1000,1300),
                                    trapezoid_mf(1000,1300,1500,1500))

  expect_that (class(fp), equals("fuzzy_partitions"))
  expect_that (fp, equals(listfp))
})

test_that("define fuzzy partitions with illegal conditions", {
  expect_error(fuzzy_partitions(triangle_mf(450,450,550), triangle_mf(450,550,600), c(1,2,3)))

})


test_that("degree_mf", {

   w <- degree_mf(triangle_mf(450,450,550),450)

   expect_that (w, equals(1))

   w <- degree_mf(trapezoid_mf(450,450,550,550),550)

   expect_that (w, equals(1))

   w<- degree_mf(fuzzy_partitions(triangle_mf(450,450,550),
                                 triangle_mf(450,550,600),
                                   trapezoid_mf(550,600,800,1000),
                                  triangle_mf(800,1000,1300),
                                   trapezoid_mf(1000,1300,1500,1500)),650)
   expect_that (w, equals(c(0,0,1,0,0)))

})
