context("gb  ")

test_that("gb(... = char vec)", {
  skip_on_cran()

  ring_(c("x","y","z"), "QQ")

  actual <- gb("x y", "x z", "x")

  expect <- list(mp("x"))
  class(expect) <- c("m2_grobner_basis", "m2", "mpolyList")
  m2_name(expect) <- m2_name(actual)
  m2_meta(expect) <- list(ideal = m2_meta(actual, "ideal"))

  expect_equal(actual, expect)
})







context("gb_ ")


test_that("gb_(char vec)",{
  skip_on_cran()

  ring_(c("x", "y", "z"), "QQ")

  actual <- gb_(c("x y", "x z", "x"))

  expect <- list(mp("x"))
  class(expect) <- c("m2_grobner_basis", "m2", "mpolyList")
  m2_name(expect) <- m2_name(actual)
  m2_meta(expect) <- list(ideal = m2_meta(actual, "ideal"))

  expect_equal(actual, expect)
})


test_that("gb_(mpolyList)",{
  skip_on_cran()

  ring_(c("x", "y", "z"), "QQ")

  mpolys <- mp(c("x y", "x z", "x"))
  actual <- gb_(mpolys)

  expect <- list(mp("x"))
  class(expect) <- c("m2_grobner_basis", "m2", "mpolyList")
  m2_name(expect) <- m2_name(actual)
  m2_meta(expect) <- list(ideal = m2_meta(actual, "ideal"))

  expect_equal(actual, expect)
})


test_that("gb_(list o chars)",{
  skip_on_cran()

  ring_(c("x", "y", "z"), "QQ")

  actual <- gb_(list("x y", "x z", "x"))

  expect <- list(mp("x"))
  class(expect) <- c("m2_grobner_basis", "m2", "mpolyList")
  m2_name(expect) <- m2_name(actual)
  m2_meta(expect) <- list(ideal = m2_meta(actual, "ideal"))

  expect_equal(actual, expect)
})


test_that("gb_(list o mpolys)",{
  skip_on_cran()

  ring_(c("x", "y", "z"), "QQ")

  actual <- gb_(list(mp("x y"), mp("x z"), mp("x")))

  expect <- list(mp("x"))
  class(expect) <- c("m2_grobner_basis", "m2", "mpolyList")
  m2_name(expect) <- m2_name(actual)
  m2_meta(expect) <- list(ideal = m2_meta(actual, "ideal"))

  expect_equal(actual, expect)
})


test_that("gb_(c'd mpolys)",{
  skip_on_cran()

  ring_(c("x", "y", "z"), "QQ")

  expect_error(
    gb_(c(mp("x y"), mp("x z"), mp("x"))),
    "you appear to have used c*"
  )
})


test_that("gb_(m2_ideal)",{
  skip_on_cran()

  ring_(c("x", "y", "z"), "QQ")

  I <- ideal_(mp(c("x y", "x z", "x")))
  actual <- gb_(I)

  expect <- list(mp("x"))
  class(expect) <- c("m2_grobner_basis", "m2", "mpolyList")
  m2_name(expect) <- m2_name(actual)
  m2_meta(expect) <- list(ideal = m2_meta(actual, "ideal"))

  expect_equal(actual, expect)
})


test_that("gb_(m2_ideal_pointer)",{
  skip_on_cran()

  ring_(c("x", "y", "z"), "QQ")

  I. <- ideal_.(mp(c("x y", "x z", "x")))
  actual <- gb_(I.)

  expect <- list(mp("x"))
  class(expect) <- c("m2_grobner_basis", "m2", "mpolyList")
  m2_name(expect) <- m2_name(actual)
  m2_meta(expect) <- list(ideal = m2_meta(actual, "ideal"))

  expect_equal(actual, expect)
})










context("gb_.")



