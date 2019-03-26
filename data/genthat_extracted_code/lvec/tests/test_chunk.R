

context("Chunk")

test_that("chunk does what it is supposed to do", {
  x <- as_lvec(1:10)

  c <- chunk(x)
  expect_that(c, equals(list(c(1, 10))))

  c <- chunk(numeric(0))
  expect_that(c, equals(list()))

  c <- chunk(as_lvec(numeric(0)))
  expect_that(c, equals(list()))

  c <- chunk(NA)
  expect_that(c, equals(list(c(1,1))))

  c <- chunk(as_lvec(NA))
  expect_that(c, equals(list(c(1,1))))

  x <- as_lvec(1:2E6)
  c <- chunk(x, chunk_size = 1E6)
  expect_that(c, equals(list(c(1, 1E6), c(1E6+1, 2E6))))
  
  expect_warning(c <- chunk(1:10, c(10, 1)))
  expect_that(c, equals(list(c(1,10))))
  
  expect_error(chunk(1:10, numeric(0)))
})

