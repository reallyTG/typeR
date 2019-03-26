
context("Storing attributes of R-objects")

test_that("attributes can be set and retrieved", {
  a <- lvec(10, "integer")

  expect_that(rattr(a, "foo"), equals(NULL))
  expect_that(rattr(a), equals(list()))

  rattr(a, "foo") <- "bar"
  expect_that(rattr(a, "foo"), equals("bar"))
  expect_that(rattr(a), equals(list(foo="bar")))

  b <- as_rvec(a)
  expect_that(attr(b, "foo"), equals("bar"))

  rattr(a) <- list(bar = "foo")
  expect_that(rattr(a, "bar"), equals("foo"))
  expect_that(rattr(a), equals(list(bar="foo")))
})

test_that("clone also clones attributes", {
  a_r <- as.factor(sample(letters, 10))
  a   <- as_lvec(a_r)

  b   <- clone(a)
  expect_that(rattr(b), equals(rattr(a)))
  expect_that(attributes(as_rvec(b)), equals(attributes(a_r)))
})

test_that("lget copies attributes", {
  a_r <- as.factor(sample(letters, 10))
  a   <- as_lvec(a_r)

  b   <- lget(a, 1:3)
  b_r <- a_r[1:3]

  expect_that(rattr(b), equals(rattr(a)))
  expect_that(attributes(as_rvec(b)), equals(attributes(b_r)))
})

test_that("lset handles factors correctly", {
  a_r <- as.factor(sample(letters, 10))
  a   <- as_lvec(a_r)

  expect_error(lset(a, 1, 100))
  expect_error(lset(a, 1, as.factor(c("foo", "bar"))))

  b_r  <- a_r[10:1]
  b    <- as_lvec(b_r)
  lset(a, 1:10, b)
  expect_that(as_rvec(a), equals(as_rvec(b)))

  lset(a, 1:10, a_r)
  expect_that(as_rvec(a), equals(as_rvec(a_r)))
})

