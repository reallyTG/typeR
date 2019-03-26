context("padZero()")

test_that("padZero() returns historical examples", {

   x1 <- padZero(c(1, 10, 100))
   # Produced with hardCode(padZero(c(1,10,100)), vname = "x1c", vert = F)
   x1c <- c("001", "010", "100")
   expect_identical(x1, x1c)

   x2 <- padZero(c(1,10,100), num = 4)
   # Produced with hardCode(padZero(c(1,10,100), num = 4), vert = F, vname = "x2c")
   x2c <- c("0001", "0010", "0100")
   expect_identical(x2, x2c)

   x3 <- padZero(c(1.2, 1.34, 1.399), side = "r")
   # Produced with hardCode(padZero(c(1.2, 1.34, 1.399), side = "r"), vert = F, vname = "x3c")
   x3c <- c("1.200", "1.340", "1.399")
   expect_identical(x3, x3c)

   x4 <- padZero(c(1.2, 1.34, 1.399), num = 5, side = "r")
   # Produced with hardCode(padZero(c(1.2, 1.34, 1.399), num = 5, side = "r"), vert = F, vname = "x4c")
   x4c <- c("1.20000", "1.34000", "1.39900")
   expect_identical(x4, x4c)

   x5 <- padZero(c("a", "ab", "abc"))
   # Produced with hardCode(padZero(c("a", "ab", "abc")), vert = F, vname = "x5c")
   x5c <- c("00a", "0ab", "abc")
   expect_identical(x5, x5c)

   x6 <- padZero(c("a", "ab", "abc"), num = 4)
   # Produced with hardCode(padZero(c("a", "ab", "abc"), num = 4), vert = F, vname = "x6c")
   x6c <- c("000a", "00ab", "0abc")
   expect_identical(x6, x6c)

   x7 <- padZero(1:5)
   # Produced with hardCode(padZero(1:5), vert = F, vname = "x7c")
   x7c <- c("1", "2", "3", "4", "5")   
   expect_identical(x7, x7c)

   x8 <- padZero(c("", ""), num = 3)
   # Produced with hardCode(padZero(c("", ""), num = 3), vert = F, vname = "x8c")
   x8c <- c("000", "000")
   expect_identical(x8, x8c)
   
})

test_that("padZero() returns errors and warnings as expected", {

   expect_error(padZero(TRUE), "'x' must be a numeric")
   expect_error(padZero(list(x = rnorm(3))), "'x' must be a numeric")   
   expect_error(padZero(integer(0)), "'x' must be a numeric")

   expect_error(padZero(4, num = "t"), "'num' must be NULL or a")
   expect_error(padZero(4, num = 4.2), "'num' must be NULL or a")
   expect_error(padZero(4, num = c(7, 4)), "'num' must be NULL or a")
   expect_error(padZero(4, num = -1), "'num' must be NULL or a")

   expect_error(padZero(7, side = c("left", "ri")), "'arg' must be of length 1", fixed = TRUE)
   expect_error(padZero(7, side = "noon"), "'arg' should be one of", fixed = TRUE)

   expect_warning(padZero(c(444, 44), num = 1), "is less than the largest number of characters")
   
   expect_error(padZero(letters[1:3], side = "r"), "'vec' should be numeric when \"side = 'right'\"", fixed = TRUE)

   expect_warning(padZero(c(4.44, 4.44), num = 1, side = "ri"), "is less than the largest number of decimals")
   
})
