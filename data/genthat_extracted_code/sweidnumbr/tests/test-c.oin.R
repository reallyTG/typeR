
context("c.oin")

test_that(desc="class: oin",{
  x <- as.oin("556000-4615")
  y <- as.oin(c("556000-4615", "232100-0156", "802002-4280"))
  xy <- c(x, y)
  expect_is(xy, class = "oin")
  expect_equal(as.character(xy), c("556000-4615", "556000-4615", "232100-0156", "802002-4280"))
})

