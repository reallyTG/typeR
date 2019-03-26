context("Grouping and Seasons")

x <-    c(1, 1, 1, 2, 1, 1, 1, 1, NA, NA, NA, 1, 1, 1, 1, 1, 1, 1, 1, NA, NA)
grp <-  c(1, 1, 1, 2, 3, 3, 3, 3,  4,  5,  6, 7, 7, 7, 7, 7, 7, 7, 7,  8,  9)
grp2 <- c(1, 1, 1, 2, 3, 3, 3, 3,  3,  3,  3, 3, 3, 3, 3, 3, 3, 3, 3,  3,  3)


test_that("group() always starts with group 1", {
  expect_equal(group(x, as.factor = F)[1], 1)
  expect_equal(group(c(-10, x), as.factor = F)[1], 1)
  expect_equal(group(c(NA, x), as.factor = F)[1], 1)
  expect_equal(group(NA, as.factor = F)[1], 1)
})

test_that("output of group() is of same length as input", {
  for(i in c(1, 10, 100)) {
    y <- sample(x, size = i, replace = T)
    expect_equal(length(group(y, as.factor = F)), i)
  }
})


test_that("argument as.factor works", {
  expect_s3_class(group(x), "factor")
  expect_s3_class(group(x, as.factor = TRUE), "factor")
  expect_is(group(x, as.factor = FALSE), "numeric")
})


test_that("some results are correct", {
  expect_equal(group(x, as.factor = F), grp)
  expect_equal(group(x, new.group.na = T, as.factor = F), grp)
  expect_equal(group(x, new.group.na = F, as.factor = F), grp2)
})


# these are startpoints
season <- as.Date(c("2015-05-01", "2015-12-01"))
names(season) <- c("summer", "winter")

x <- seq(from = as.Date("2015-01-01"), to = as.Date("2015-12-01"),
         by = "months")

grp <- factor(c(rep("winter", 4), rep("summer", 7), rep("winter", 1)),
              levels = c("summer", "winter"))

test_that(".periods2() handles varying correctly", {
  expect_equal(.period2(x, varying = "monthly"),
               as.numeric(format(x, "%m")))
  expect_equal(.period2(x, varying = "daily"),
               as.numeric(format(x, "%j")))
  expect_equal(.period2(x, varying = "weekly"),
               as.numeric(format(x, "%V")))
  expect_equal(unique(.period2(x, varying = "constant")), 1)

  expect_equal(.period2(x, varying = season), grp)
})






